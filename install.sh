#!/bin/sh
python3 /spark-install/setup.py
cat slaves | while read line
do
    if [ "$line" = "-" ]; then
        echo "Skip $line"
    else
        ssh root@$line -n "rm -rf /spark-install/ && mkdir /spark-install/"
        echo "Copy data to $line"
        scp  /spark-install/setup.py root@$line:/spark-install/ && scp /spark-install/master root@$line:/spark-install/ && scp /spark-install/slaves root@$line:/spark-install/
        echo "Setup $line"
        ssh root@$line -n "cd /spark-install/ && python3 setup.py"
        echo "Finished config node $line"
    fi
done
