#! /bin/bash
NDK_PRJ_HOME=./cp_ndk_out
for entry in ./*
do
  if [[ $entry =~ ./out-* ]]
  then
    OUTDIR=$entry
    IFS='-' read -ra model <<< "$entry"
    MODEL=${model[1]}
    IFS='_' read -ra modelshort <<< "$MODEL"
    MODELSHORT=${modelshort[0]}
  fi
done
if [[ -z $MODEL ]]
then
    echo "error: cannot find out dir...quit."
    exit
fi
if [[ -d $NDK_PRJ_HOME ]]
then
while true; do
    read -p "A U willing to delete all existing files in $NDK_PRJ_HOME?(yes/no) " yn
    case $yn in
        YES|yes ) rm -rf $NDK_PRJ_HOME; break;;
        NO|no )  echo "quit with no action"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi
mkdir $NDK_PRJ_HOME
echo "========= make build.bat ========="
BOARDCONFIGDIR=./device/lge/$MODELSHORT/$MODEL
if [[ ! -d $BOARDCONFIGDIR ]]
then
  IFS=' ' read -ra $BOARDCONFIGDIR <<< $(find device -name $MODEL)
  if [[ ${#BOARDCONFIGDIR[@]} -ne 1 ]] || [[ ! -d $BOARDCONFIGDIR ]]
  then
    echo "cannot find BOARDCONFIG file.. please do not use build.bat which will be generated"
  fi
fi
while IFS='' read -r line || [[ -n "$line" ]]; do
    IFS=' ' read -ra readvar <<< "$line"
    case ${readvar[0]} in
        LGE_IMS_SRC ) LGE_IMS_SRC_VAR=${readvar[0]}; LGE_IMS_SRC_VAL=${readvar[2]};;
        LGE_IMS_VERSION ) LGE_IMS_VERSION_VAR=${readvar[0]}; LGE_IMS_VERSION_VAL=${readvar[2]};;
        LGE_IMS_ALIAS ) LGE_IMS_ALIAS_VAR=${readvar[0]}; LGE_IMS_ALIAS_VAL=${readvar[2]};;
        LGE_IMS_SYSTEM_SERVICES ) LGE_SYSTEM_SERVICES_VAR=LGE_SYSTEM_SERVICES; LGE_SYSTEM_SERVICES_VAL=${readvar[2]};;
        LGE_IMS_FEATURES ) LGE_IMS_FEATURES_VAR=${readvar[0]}; LGE_IMS_FEATURES_VAL=$(echo $line | awk -F ' := ' '{print $2}');;
        LGE_IMS_MEDIA_FEATURES ) LGE_IMS_MEDIA_FEATURES_VAR=${readvar[0]}; LGE_IMS_MEDIA_FEATURES_VAL=$(echo $line | awk -F ' := ' '{print $2}');;
        LGE_IMS_CHIPSET ) LGE_IMS_CHIPSET_VAR=${readvar[0]}; LGE_IMS_CHIPSET_VAL=$(echo $line | awk -F ' := ' '{print $2}');;
        LGE_IMS_RCS_VERSION ) LGE_IMS_RCS_VERSION_VAR=${readvar[0]}; LGE_IMS_RCS_VERSION_VAL=${readvar[2]};;
        TARGET_CARRIER ) TARGET_CARRIER_VAR=${readvar[0]}; TARGET_CARRIERVAL=${readvar[2]};;
        TARGET_COUNTRY ) TARGET_COUNTRY_VAR=${readvar[0]}; TARGET_COUNTRYVAL=${readvar[2]};;
    esac
done < "$BOARDCONFIGDIR/BoardConfig.mk"
BATCHFILE=$NDK_PRJ_HOME/build.bat
echo "@echo off
set NDK_HOST_32BIT=1
set $LGE_IMS_SRC_VAR=$LGE_IMS_SRC_VAL
set $LGE_IMS_VERSION_VAR=$LGE_IMS_VERSION_VAL
set $LGE_IMS_ALIAS_VAR=$LGE_IMS_ALIAS_VAL
set LGE_IMS_MULTILIB=32
set $LGE_SYSTEM_SERVICES_VAR=$LGE_SYSTEM_SERVICES_VAL
set $LGE_IMS_FEATURES_VAR=$LGE_IMS_FEATURES_VAL
set $LGE_IMS_MEDIA_FEATURES_VAR=$LGE_IMS_MEDIA_FEATURES_VAL
set $LGE_IMS_RCS_VERSION_VAR=$LGE_IMS_RCS_VERSION_VAL
set PLATFORM_VERSION=5.0
set BUILD_PLATFORM=NDK
set $TARGET_CARRIER_VAR=$TARGET_CARRIERVAL
set $TARGET_COUNTRY_VAR=$TARGET_COUNTRYVAL
set $LGE_IMS_CHIPSET_VAR=$LGE_IMS_CHIPSET_VAL
IF "%1" == "CLEAN" GOTO CLEAN
IF "%1" == "" GOTO ERROR:
../../../../../../../../ndk-build NDK_PROJECT_PATH=../../../../out APP_BUILD_SCRIPT=Android.mk -C ../../../ImsA
GOTO EXIT
:CLEAN
rm -rf ../../../../../../out
rm -rf ../../java/rvi/bin/Ims4.apk
rm -rf ../../java/rcsprovider/bin/RCSProvider.apk
GOTO EXIT
:ERROR
@echo \"===================================================\"
@echo \" Please run  : build option\"
@echo \"      option : TMUS | ATT | P1BSSN | CLEAN\"
@echo \"===================================================\"
:EXIT" > $BATCHFILE
echo "==========================================="
echo "========= copy static libraries... ========="
SOLIB_DIR=$NDK_PRJ_HOME/sharedLib
mkdir $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libandroid_runtime.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libbinder.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libc.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libcrypto.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libcutils.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libdl.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libext2_uuid.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libgui.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libimsmmpf.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/liblog.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libm.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libnativehelper.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libnetd_client.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/vendor/lib/libqmi.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/vendor/lib/libqmi_client_qmux.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libsqlite.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libssl.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libstdc++.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libsurfaceflinger.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libutils.so $SOLIB_DIR
cp $OUTDIR/target/product/$MODELSHORT/system/lib/libz.so $SOLIB_DIR
if [[ $LGE_IMS_FEATURES_VAL == *WMS* ]]
then
  QMI_WMS_CLIENT_HELPER=$OUTDIR/target/product/$MODELSHORT/system/vendor/lib/libqmi_wms_client_helper.so
  if [[ -f $QMI_WMS_CLIENT_HELPER ]]
 then
    cp $OUTDIR/target/product/$MODELSHORT/system/vendor/lib/libqmi_wms_client_helper.so $SOLIB_DIR
  fi
  cp $OUTDIR/target/product/$MODELSHORT/system/vendor/lib/libwms.so $SOLIB_DIR
  FEATUREFILE=./vendor/lge/apps/ImsA/build/rcs/RCS_feature.mk
  FEATUREOUT=$NDK_PRJ_HOME/RCS_feature.mk
  if [[ -r $FEATUREFILE ]]
  then
    while read -r line
    do
      if [[ $line == *qmi/platform* ]]
      then
        echo $line >> $FEATUREOUT
        echo '$(IMS_ROOT_DIR)../../../../vendor/qcom/proprietary/qmi/wms_client_helper \' >> $FEATUREOUT
        echo '$(IMS_ROOT_DIR)../../../../vendor/qcom/proprietary/qmi/src \' >> $FEATUREOUT
        echo '$(IMS_ROOT_DIR)../../../../vendor/qcom/proprietary/qmi/core/lib/inc \' >> $FEATUREOUT
      elif [[ $line == *lqmi_client_qmux* ]]
      then
        echo $line >> $FEATUREOUT
        if [[ -f $QMI_WMS_CLIENT_HELPER ]]
        then
            echo '-lqmi_wms_client_helper\' >> $FEATUREOUT
        fi
      else
        echo $line >> $FEATUREOUT
      fi
    done < $FEATUREFILE
  else
    echo "* you need to append wms features into RCSFeature file."
    echo "* path: android/vendor/lge/apps/ImsA/build/rcs/RCS_feature.mk"
    echo "--------------------------------------"
    echo "     at LOCAL_INCLUDES_CYGWIN         "
    echo "--------------------------------------"
    echo ' - "$(IMS_ROOT_DIR)./../../../vendor/qcom/proprietary/qmi/wms_client_helper \"'
    echo ' - "$(IMS_ROOT_DIR)../../../../vendor/qcom/proprietary/qmi/src \"'
    echo ' - "$(IMS_ROOT_DIR)../../../../vendor/qcom/proprietary/qmi/core/lib/inc \"'
    echo "--------------------------------------"
    echo "     at LOCAL_LIB_CYGWIN          "
    echo "--------------------------------------"
    echo ' - "-lqmi_wms_client_helper\"'
    echo "--------------------------------------"
  fi
fi
echo "==========================================="
echo "========= copy java libraries... ========="
JLIB_DIR=$NDK_PRJ_HOME/javaLib
mkdir $JLIB_DIR
cp $OUTDIR/target/common/obj/JAVA_LIBRARIES/com.lge.frameworks_intermediates/classes.jar $JLIB_DIR/com.lge.frameworks_intermediates.jar
cp $OUTDIR/target/common/obj/JAVA_LIBRARIES/core-libart_intermediates/classes.jar $JLIB_DIR/core-libart_intermediates.jar
cp $OUTDIR/target/common/obj/JAVA_LIBRARIES/framework_intermediates/classes.jar $JLIB_DIR/framework_intermediates.jar
cp $OUTDIR/target/common/obj/JAVA_LIBRARIES/ims-common_intermediates/classes.jar $JLIB_DIR/ims-common_intermediates.jar
cp $OUTDIR/target/common/obj/JAVA_LIBRARIES/telephony-common_intermediates/classes.jar $JLIB_DIR/telephony-common_intermediates.jar
echo "==========================================="
echo "========= copy header files... ========="
#cp --parents -R "./vendor/qcom/proprietary/qcril/qcril_qmi/" $NDK_PRJ_HOME
cp --parents ./vendor/qcom/proprietary/qcril/qcril_qmi/*.h $NDK_PRJ_HOME
cp --parents ./vendor/qcom/proprietary/qcril/qcril_qmi/**/*.h $NDK_PRJ_HOME
cp --parents ./vendor/qcom/proprietary/common/**/*.h $NDK_PRJ_HOME
cp --parents ./vendor/qcom/proprietary/qmi/**/*.h $NDK_PRJ_HOME
cp --parents ./vendor/qcom/proprietary/qmi-framework/**/*.h $NDK_PRJ_HOME
cp --parents ./external/openssl/include/openssl/*.h $NDK_PRJ_HOME
cp --parents ./external/boringssl/include/openssl/*.h $NDK_PRJ_HOME
cp --parents ./external/sqlite/dist/sqlite3.h $NDK_PRJ_HOME
cp --parents ./external/e2fsprogs/lib/uuid/uuid*.h $NDK_PRJ_HOME
cp --parents ./hardware/libhardware/include/hardware/fb.h $NDK_PRJ_HOME
cp --parents ./hardware/libhardware/include/hardware/gralloc.h $NDK_PRJ_HOME
cp --parents ./hardware/libhardware/include/hardware/hardware.h $NDK_PRJ_HOME
cp --parents ./bionic/libc/dns/include/resolv_netid.h $NDK_PRJ_HOME
cp --parents ./libnativehelper/include/nativehelper/JNIHelp.h $NDK_PRJ_HOME
cp --parents ./frameworks/native/include/binder/*.h $NDK_PRJ_HOME
cp --parents ./frameworks/native/include/gui/*.h $NDK_PRJ_HOME
cp --parents ./frameworks/native/include/ui/*.h $NDK_PRJ_HOME
cp --parents ./system/core/include/cutils/*.h $NDK_PRJ_HOME
cp --parents ./system/core/include/log/*.h $NDK_PRJ_HOME
cp --parents ./system/core/include/private/*.h $NDK_PRJ_HOME
cp --parents ./system/core/include/system/*.h $NDK_PRJ_HOME
cp --parents ./system/core/include/utils/*.h $NDK_PRJ_HOME
cp --parents ./system/netd/include/*.h $NDK_PRJ_HOME
#patch for error
#libims/imscore/Platform/External/Impl/Android/Wms/AndroidWmsProxy.cpp:23:35: fatal error: qmi_wms_client_helper.h: No such file or directory
#cp $NDK_PRJ_HOME/vendor/qcom/proprietary/qmi/wms_client_helper/qmi_wms_client_helper.h $NDK_PRJ_HOME/vendor/qcom/proprietary/qmi/platform
echo "==========================================="
KEYHOME=$NDK_PRJ_HOME/signingKey
mkdir -p $KEYHOME
echo "========= creating signing key... ========="
cp build/target/product/security/platform.pk8 $KEYHOME
cp build/target/product/security/platform.x509.pem $KEYHOME
openssl pkcs8 -inform DER -nocrypt -in $KEYHOME/platform.pk8 -out $KEYHOME/platform.pem
openssl pkcs12 -export -in $KEYHOME/platform.x509.pem -inkey $KEYHOME/platform.pem -out $KEYHOME/platform.p12 -password pass:android -name androiddebugkey
keytool -importkeystore -deststorepass android -destkeystore $KEYHOME/platform.jks -srckeystore $KEYHOME/platform.p12 -srcstoretype PKCS12 -srcstorepass android
rm $KEYHOME/platform.p* $KEYHOME/platform.x*
echo "==========================================="
IMSHOME=$NDK_PRJ_HOME/vendor/lge/apps
mkdir -p $IMSHOME
BRANCH=$(ls ../.repo/manifests.git/refs/remotes/m/)
echo $BRANCH > $NDK_PRJ_HOME/branch_name.txt
echo "source build/envsetup.sh
choosecombo 1 $MODEL 2" > $NDK_PRJ_HOME/build_command.txt
if [[ $BRANCH =~ .*jansky.* ]]
then
  cp $OUTDIR/target/common/obj/JAVA_LIBRARIES/com.lge.jansky_intermediates/classes.jar $JLIB_DIR/com.lge.jansky_intermediates.jar
fi
echo "copy-for-ndk success.. DIRECTORY : ($NDK_PRJ_HOME)"
echo "========= creating zip file... ========="
read -p "zip $NDK_PRJ_HOME?(yes/no) " yn
case $yn in
  YES|yes ) tar -jcvf ndkout.tar.bz2 $NDK_PRJ_HOME;;
  * )  echo "Thank you."; exit;;
esac
mv ndkout.tar.bz2 $NDK_PRJ_HOME
echo "==========================================="
echo "
ndkout.tar.bz2 file is created at $NDK_PRJ_HOME
Thank you."