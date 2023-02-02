#!/system/bin/sh
MODDIR=/data/adb/modules/SetoSkins/
while true; do
    status=$(cat /sys/class/power_supply/battery/status)
    capacity=$(cat /sys/class/power_supply/battery/capacity)
    temp=$(expr $(cat /sys/class/power_supply/battery/temp) / 10)
    ChargemA=$(expr $(cat /sys/class/power_supply/battery/current_now) / -1000)
    #写入日志
    if [[ $status == "Charging" ]] && [[ $ChargemA -gt 300 ]]; then
        echo $(date) $hint" 电量$capacity% 温度$temp℃ 电流$ChargemA"mA"" >>"$MODDIR"/log.log
    fi
    sleep 40
done
