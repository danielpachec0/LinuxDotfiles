aux=`ps auxf | grep "polybar sensors" -c`
if [ $aux -gt 1 ];
then
    pkill -9 -e -f "polybar sensors"
else
    polybar sensors
fi