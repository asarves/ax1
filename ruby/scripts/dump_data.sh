the_date=$(date '+%d-%m-%Y')

for i in enfance dependance 
do 
    mysqldump -u root -padmin job$i > job${i}.dump.${the_date}.sql
    # bzip2 new-doli-job${i}.dump.${the_date}.sql
done
