#!/bin/bash

SPIRENT="Spirent"
RNS="Normal, R&S"

testEquipment=$RNS
spirent_num_prefix="817810"
rnsCmdGuide="\n\
c : Change test mode to Spirent"

spirentCmdGuide="\n\
1 : Add contacts 9560~9561\n\
2 : Add contacts 1001~1015\n\
3 : Add contacts 2001~2002, 3001~3002\n\
\n\
c : Change test mode to Normal, R&S"

commonCmdGuide="\n\
a : Airplane mode On\n\
f : Airplane mode Off\n\
D : Delete RCS DB\n\
x : Exit\n\
====================================================="

handleNumberActionGuide="\0 1) Add contact\n
 2) Send Message (just write)\n
 3) Send message (write & auto sending)\n
 0) Back"


contact_9560_9561="8178109560 8178109561"
conatct_1001to1011="8178101001 8178101002 8178101003 8178101004 8178101005 8178101006
                    8178101007 8178101008 8178101009 8178101010 8178101011"
contact_1001to1015="8178101001 8178101002 8178101003 8178101004 8178101005 8178101006
                    8178101007 8178101008 8178101009 8178101010 8178101011 8178101012
                    8178101013 8178101014 8178101015"
contact_200x_300x="8178102001 8178102002 8178103001 8178103002"

#goToNext()
#{
#    input=
#    while ([ : ]) do
#        case $input in
#            y|'Y')return 0;;
#            *);;
#        esac
#            echo "Go to next? (y,Y)"
#            read -e -r input
#    done
#}

requestInput() # $1= return arg $2= Question, $3= Integer only flag
{
    local question=$2
    local integerCheck=$3
    local result=$1 _p _t
    shift

    local input=

     while ([ : ]) do
        while IFS="" read -r -e -d $'\n' -p "$question >> " input; do 
            history -s "$input"
            break; 
        done

        case $input in
            *)
                local tmp=`echo $input | sed -e 's/\ //g'`
                if [[ $integerCheck != "INTEGER" ]]; then
                    break; 
                elif [[ $integerCheck == "INTEGER" && $tmp =~ ^-?[0-9]+$ && $input != ''  ]]; then
                    break;
                else
                    if [[ $input != '' ]]; then
                        echo "Retry) "
                    fi
                fi
                ;;
        esac

    done

    eval "$result=\$input"
}

addNewContacts() # $1, $2, ... converted phone number
{
    local count=$#
    local args
    #fist show current contacts list
    adb shell am start -n "com.android.contacts/com.android.contacts.activities.PeopleActivity" -a "android.intent.action.MAIN"

    # 'IFS' is string tokenizer 
    IFS=' ' read -a args <<< $@

    for ((i=0;i<count;i++)) do
        adb shell am start -n "com.android.contacts/com.android.contacts.activities.ContactEditorActivity" \
          -a "android.intent.action.INSERT" -d "vnd.android.cursor.dir/raw_contact" --es phone "${args[i]}" --es name "${args[i]}"
    done

    #last contact save & show contact list
    adb shell am start -n "com.android.contacts/com.android.contacts.activities.PeopleActivity" -a "android.intent.action.MAIN"
}


messageSending()
{
    adb shell input keyevent 22 && \
    adb shell input keyevent 22 && \
    adb shell input keyevent 66
}

convertPhoneNumber() # $1= return arg, $2, $3, ...= numbers (1002 1234 2323)
{
#    local arrCount=`expr $# - 1`
    local result=$1 _p _t
    shift

    local arrCount=$#
    local args
    IFS=' ' read -a args <<< $@
    
    for ((i=0;i<arrCount;i++)) do
        if [[ ${#args[i]} = 4 ]]; then
            args[i]=${spirent_num_prefix}${args[i]}
        fi
    done
    eval "$result=\${args[@]}"
}

handlePhoneNumberInput() # $1, $2, ...= user input numbers
{
    local answer
    local phone
    convertPhoneNumber phone $@
    echo -e "\n Phone number : $phone\n"

    #String parameter string using $xxx is not printed by 'echo'... it is bug?
    echo -e $handleNumberActionGuide

    while ([ : ]) do
        requestInput answer "Select Action" "INTEGER"

        case $answer in
            1) addNewContacts $phone
                break;;
            2) writeMessage 0 $phone
                break;;
            3) writeMessage "AUTOSEND" $phone
                break;;
            0) echo "Cancle)"
                break;;
            *) echo "Retry)"
        esac
    done
}

writeMessage() # $1= Auto sending flag, $2, $3, ... = user input numbers
{
    local AUTOSEND=$1
    shift

    local to=$@
    to=`echo $to | sed -e 's/\ /,/g'`

    local body
    requestInput body "Send Message) Message body (MUST alphabet or number)"
    echo -e "\n To:[$to], MessageBody:[$body]\n"

    openMSGWriteActivity $to $body

    if [[ $AUTOSEND = "AUTOSEND" ]]; then
        messageSending
    fi
}

#HandleWriteMessageInput() # $1=auto sending flag
#{
#    local to
#    requestInput to "Send Message) Target number(s) (ex. 1001 1002)" "INTEGER"
#    convertPhoneNumber to $to
#
#    local body
#    requestInput body "Send Message) Message body (MUST alphabet or number)"
#    echo "To:[$to], MessageBody:[$body]"
#
#    openMSGWriteActivity $to $body
#
#    if [[ $1 = "AUTOSEND" ]]; then
#        messageSending
#    fi
#}

openMSGWriteActivity() # $1=To, $2=Body
{
    local body=$2
    if [[ $body == '' ]]; then
        adb shell am start -n "com.android.mms/com.android.mms.ui.ComposeMessageActivity" -a "android.intent.action.SENDTO" -d "$1"
    else
        adb shell am start -n "com.android.mms/com.android.mms.ui.ComposeMessageActivity" -a "android.intent.action.SENDTO" -d "$1" --es sms_body "$body"
    fi
    echo
}

DeleteRcsDB()
{
    echo "--DB files--"
    adb shell ls -al /data/data/com.lge.ims/databases/ims_eab*
    echo -e "\nDeleting..\n"
    adb shell rm -rf /data/data/com.lge.ims/databases/ims_eab*
    echo "--Result--"
    adb shell ls -al /data/data/com.lge.ims/databases/ims_eab*

}

SetAirplaneOn()
{
    adb shell settings put global airplane_mode_on 1
    adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true
}

SetAirplaneOff()
{
    adb shell settings put global airplane_mode_on 0
    adb shell am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true
}

HandleCommonCMD()
{
    case $1 in
        a) SetAirplaneOn
            break;;
        f) SetAirplaneOff
            break;;
        D) DeleteRcsDB
            break;;
        x|X) exit 0;;
    esac
}

HandleSpirentCMD()
{
    while ([ : ]); do
        local cmd=
        requestInput cmd 'Input command OR 4-digit number set(ex. 9560 9561)'

        case $cmd in
            1) addNewContacts $contact_9560_9561
                break;;
            2) addNewContacts $contact_1001to1015
                break;;
            3) addNewContacts $contact_200x_300x
                break;;
            c|C)
                if [[ $testEquipment == $SPIRENT ]]; then
                    spirent_num_prefix=''
                    testEquipment=$RNS
                fi
                break;;
            a|f|x|X|D)
                HandleCommonCMD $cmd
                break;;
            *)
                tmp=`echo $cmd | sed -e 's/\ //g'`
                # If $cmd is more than 10, it does not converted integer..
                if [[ $tmp =~ ^-?[0-9]+$ ]]; then # && ${#tmp} > 3 ]]; then
                    handlePhoneNumberInput ${cmd}
                    break;
                else
                    echo "Retry) "
                fi
                shift;;
        esac
    done
}

HandleRnsCMD()
{
    while ([ : ]); do
        local cmd=
        requestInput cmd 'Input command OR Full number set(ex. 12345678901 12345678902)'

        case $cmd in
            c|C)
                if [[ $testEquipment == $RNS ]]; then
                    spirent_num_prefix=817810
                    testEquipment=$SPIRENT
                fi
                break;;
            a|f|x|X|D)
                HandleCommonCMD $cmd
                break;;
            *)
                tmp=`echo $cmd | sed -e 's/\ //g'`
                # If $cmd is more than 10, it does not converted integer..
                if [[ $tmp =~ ^-?[0-9]+$ ]]; then # && ${#tmp} > 3 ]]; then
                    handlePhoneNumberInput ${cmd}
                    break;
                fi
                echo "Retry) "
                shift;;
        esac
    done
}


##########################################################################################################################################################################
# T/C functions
##########################################################################################################################################################################



##########################################################################################################################################################################
# main loop Start
##########################################################################################################################################################################

while ([ : ]) do
    echo -e "\n\n=====================================================\n Current Equipment => [ ${testEquipment} ]"
    
    if [[ $testEquipment == $SPIRENT ]]; then
        echo -e $spirentCmdGuide $commonCmdGuide
        HandleSpirentCMD
    elif [[ $testEquipment == $RNS ]]; then
        echo -e $rnsCmdGuide $commonCmdGuide
        HandleRnsCMD
    fi

    echo
    cmd=
done
