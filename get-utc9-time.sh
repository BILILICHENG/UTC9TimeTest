#!/bin/bash

file="utc9-time.txt"

utc9_date=$(TZ=Asia/Tokyo date +"%Y-%m-%d")
utc9_year=$(TZ=Asia/Tokyo date +"%Y")
utc9_month_day=$(TZ=Asia/Tokyo date +"%m-%d")

ERROR_DATES=("0000-12-13")

OK_DATES=("0000-12-14")

line2=$(sed -n '2p' "$file")
line5=$(sed -n '5p' "$file")

trigger_error=false
for d in "${ERROR_DATES[@]}"; do
    year=${d:0:4}
    month_day=${d:5:5}
    if [[ ($year == "0000" && "$utc9_month_day" == "$month_day") || ($utc9_date == "$d") ]]; then
        trigger_error=true
        break
    fi
done

trigger_ok=false
for d in "${OK_DATES[@]}"; do
    year=${d:0:4}
    month_day=${d:5:5}
    if [[ ($year == "0000" && "$utc9_month_day" == "$month_day") || ($utc9_date == "$d") ]]; then
        trigger_ok=true
        break
    fi
done

if $trigger_error; then
    new_year=$(( ${line2:0:4} - 10 ))
    new_line2="${new_year}${line2:4}"
    sed -i "2s/.*/$new_line2/" "$file"

    sed -i '5s/.*/ERROR：Services are suspended today due to the special date./' "$file"
elif $trigger_ok; then
    new_year=$(( ${line2:0:4} + 10 ))
    new_line2="${new_year}${line2:4}"
    sed -i "2s/.*/$new_line2/" "$file"

    sed -i '5s/.*/OK/' "$file"
fi
