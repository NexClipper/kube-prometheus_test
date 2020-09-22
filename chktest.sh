runok(){
running=$(kubectl get pods  -n monitoring |grep -v NAME| grep -v Running | wc -l)
while [ $running != "0" ];
do
        zzz=$((zzz+1))
        echo "count : $zzz -> Status : $running"
        running=$(kubectl get pods  -n monitoring |grep -v NAME| grep -v Running | wc -l)
        sleep 3
        if [ $zzz == "10" ]; then echo "Bye. restart plz."; exit 1; fi
done
echo "Done!"
}
runok
echo "Next Step!!!!!!"
