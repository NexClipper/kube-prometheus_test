#!/bin/bash
namespacechk=$(kubectl get ns monitoring|grep -v "NAME"|wc -l)
promoperchk=$(kubectl get all -A|grep prometheus-operator|wc -l)
if [ $namespacechk -gt 0 ]|| [ $promoperchk -gt 0 ]; then
        if [ $namespacechk -ne 0 ]; then echo "Namespace >> $(kubectl get ns monitoring|grep -v "NAME") <<"; fi
        if [ $promoperchk -ne 0 ]; then  echo "prometheus-operator find"; fi
else
        kubectl apply -f /data/klevry/kube-prometheus/setup
        bash /data/klevry/kube-prometheus/cmd/runchk.sh
        kubectl apply -f /data/klevry/kube-prometheus/
        bash /data/klevry/kube-prometheus/cmd/runchk.sh
fi
