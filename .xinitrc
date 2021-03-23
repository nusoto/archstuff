while true; do
	xsetroot -name "$( date +"%F %R" )"
	sleep 1m
done &
redshift -P -O 4500 &
exec dwm
