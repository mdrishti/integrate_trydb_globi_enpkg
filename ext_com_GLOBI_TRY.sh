export LC_ALL=C
cat common_wd_ids_TRY_GLOBI_last_12858 | parallel --pipe -L1000 -j 4 --result all_13858 grep -f - -n interactions.csv
mv all_13858/stdout all_13858.csv
pigz all_13858.csv
rm -r all_13858

