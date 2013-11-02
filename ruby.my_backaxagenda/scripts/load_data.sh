
for i in jobenfance jobdependance
do 
    echo drop $i
    mysqladmin -u root -padmin -f drop $i
    echo create $i
    mysqladmin -u root -padmin create $i
    echo load $i
    cat ../new-doli-${i}.dump* | mysql -u root -padmin $i 
done

