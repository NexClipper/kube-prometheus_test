runok(){
sleep 3
running=$(kubectl get pods  -n monitoring |grep -v NAME| grep -v Running | wc -l)
while [ $running != "0" ];
do
        ruzzz=$((ruzzz+1))
        echo "count : $ruzzz -> Status : $running"
        running=$(kubectl get pods  -n monitoring |grep -v NAME| grep -v Running | wc -l)
        sleep 3
        if [ $ruzzz == "99" ]; then echo "failed. restart plz."; exit 1; fi
done
echo "Done!"
}
runok
echo "Next Step!!!!!!"
