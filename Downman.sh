BASH="$whereis bash"
#!$BASH
clear
read -p "please Enter the hour" Hour
read -p "please Enter the Minute" Minute
read -p "input The URL or URLS(in a file) of The File you want to download It : " URL
date_hour=`date +%H`
date_minute=`date +%M`
sigma_date=$((date_hour * 60 + date_minute))
sigma_date_input=$((Hour * 60 + Minute))
while [ "$sigma_date" >= "$sigma_date_input" ]
    do
        echo "Sleeping"
        sleep 5
        echo "Running"
        date_hour=`date +%H`
        date_minute=`date +%M`
        sigma_date=$((date_hour * 60 + date_minute))
done

if [[ $URL =~ "http" ]]
    then
        wget $URL
        if [ "$?" == "0" ]
            then
                notify-send  "Your file has been downloaded Successfully :)"
            else 
	            notify-send "oops! This url not exist 😐️"
        fi
    else
        wget -i $URL
        if [ "$?" == "0" ]
            then
                notify-send  "Your file has been downloaded Successfully :)"
            else 
                notify-send "oops! This url not exist 😐️"
        fi  	
fi



