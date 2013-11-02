#!/bin/bash
rep=

if [ $# = 0 ]
then
    rep=.
else
    rep=$*
fi

echo "sudo chown -R ks304579.www-data $rep"
sudo chown -R ks304579.www-data $rep
echo "sudo chmod g+w -R $rep"
sudo chmod g+w -R $rep


