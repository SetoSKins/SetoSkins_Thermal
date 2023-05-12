chattr -i /data/vendor/thermal/config
chattr -i /data/vendor/thermal/config/*
chmod 777 /data/vendor/thermal/config
chmod 777 /data/vendor/thermal/config/*
rm -rf /data/system/package_cache/*
chattr -R -i -a /data/adb/modules/SetoSkins/
echo 0 > /sys/class/power_supply/battery/input_suspend
rm -rf /data/adb/post-fs-data.d/post-fs-data.sh
pm enable com.miui.powerkeeper/com.miui.powerkeeper.feedbackcontrol.abnormallog.ThermalLogService
pm enable com.miui.powerkeeper/com.miui.powerkeeper.logsystem.LogSystemService
pm enable com.miui.securitycenter/com.miui.permcenter.root.RootUpdateReceiver
pm enable com.miui.securitycenter/com.miui.antivirus.receiver.UpdaterReceiver
pm enable com.miui.powerkeeper/com.miui.powerkeeper.ui.CloudInfoActivity
pm enable com.miui.powerkeeper/com.miui.powerkeeper.statemachine.PowerStateMachineService
pm enable com.xiaomi.joyose/com.xiaomi.joyose.JoyoseJobScheduleService
pm enable com.xiaomi.joyose/com.xiaomi.joyose.cloud.CloudServerReceiver
pm enable com.xiaomi.joyose/com.xiaomi.joyose.predownload.PreDownloadJobScheduler
pm enable com.xiaomi.joyose/com.xiaomi.joyose.smartop.gamebooster.receiver.BoostRequestReceiver
echo '0' > /sys/class/power_supply/bms/temp
	  echo '0' > /sys/class/power_supply/battery/subsystem/battery/temp
	  echo '0' > /sys/class/power_supply/battery/temp
echo 0 > /sys/class/qcom-battery/thermal_remove
      echo "50000000" > /sys/class/power_supply/battery/constant_charge_current
      echo "50000000" > /sys/devices/platform/battery/power_supply/battery/fast_charge_current
	  echo "50000000" > /sys/devices/platform/battery/power_supply/battery/thermal_input_current
	  echo "50000000" > /sys/devices/platform/11cb1000.i2c9/i2c-9/9-0055/power_supply/bms/current_max
	  echo "50000000" > /sys/devices/platform/mt_charger/power_supply/usb/current_max
	  echo "50000000" > /sys/firmware/devicetree/base/charger/current_max
	  	    echo "50000000" > /sys/class/power_supply/battery/constant_charge_current_max
	  	        echo "50000000" >/sys/class/power_supply/battery/fast_charge_current
	  	    echo "50000000" >/sys/class/power_supply/battery/current_max
{
	until [[ "$(getprop sys.boot_completed)" == "1" ]]; 
	do
		sleep 1
	done
    settings put system min_refresh_rate 
    service call SurfaceFlinger 1035 i32
}&
/sbin/.magisk/busybox/chattr -i -a -A /cache/magisk.log
chmod 777 /cache/magisk.log
setprop ctl.restart thermal-engine
setprop ctl.restart mi_thermald
setprop ctl.restart thermal_manager
setprop ctl.restart thermal

function restart_mi_thermald(){
killall -15 mi_thermald
for i in $(which -a mi_thermald)
do
	nohup "$i" >/dev/null 2>&1 &
done
}
function mk_thermal_folder(){
resetprop -p sys.thermal.data.path /data/vendor/thermal/
resetprop -p vendor.sys.thermal.data.path /data/vendor/thermal/
chattr -R -i -a '/data/vendor/thermal'
	rm -rf '/data/vendor/thermal'
		mkdir -p '/data/vendor/thermal/config'
		chmod -R 0771 '/data/vendor/thermal'
	chown -R root:system '/data/vendor/thermal'
chcon -R 'u:object_r:vendor_data_file:s0' '/data/vendor/thermal'
mv /data/adb/modules/SetoSkins/system/cloud/thermal/seto.sh /data/adb/service.d/seto.sh
mv /data/adb/modules/SetoSkins/system/cloud/thermal/seto2.sh /data/adb/service.d/seto2.sh
touch /data/vendor/thermal/decrypt.txt
}
mk_thermal_folder
restart_mi_thermald
