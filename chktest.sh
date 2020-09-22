
nsok(){
nscreate=$(kubectl get ns monitoring|grep -v NAME |wc -l)
while [ $nscreate != "1" ];
do
        nszzz=$((nszzz+1))
        echo "count : $nszzz -> Status : $nscreate"
        nscreate=$(kubectl get ns monitoring|grep -v NAME |wc -l)
        sleep 3
        if [ $nszzz == "10" ]; then echo "failed. restart plz."; exit 1; fi
done
echo "Done!"
}
nsok

runok(){
running=$(kubectl get pods  -n monitoring |grep -v NAME| grep -v Running | wc -l)
while [ $running != "0" ];
do
        ruzzz=$((ruzzz+1))
        echo "count : $ruzzz -> Status : $running"
        running=$(kubectl get pods  -n monitoring |grep -v NAME| grep -v Running | wc -l)
        sleep 3
        if [ $ruzzz == "10" ]; then echo "failed. restart plz."; exit 1; fi
done
echo "Done!"
}
runok
echo "Next Step!!!!!!"
