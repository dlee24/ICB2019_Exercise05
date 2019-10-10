#!bin/sh
#usage: bash wages.sh
#Logan Thayer and Diane Lee's script

cat wages.csv | grep -v 'gender' | grep -E 'female' | sort -t , -nk2 -u | cut -d , -f1,2 | sed -E 's/,/ /g' > uniqcombos.txt
cat wages.csv | grep -v 'gender' | grep -E '^male' | sort -t , -nk2 -u | cut -d , -f1,2 | sed -E 's/,/ /g' >> uniqcombos.txt

echo "
Highest and Lowest Earners, Respectively"
echo "Gender,YearsExp,Wage"
cat wages.csv | grep -v "gender" | sort -t , -nrk4 | cut -d , -f 1,2,4 | head -n 1
cat wages.csv | grep -v "gender" | sort -t , -nrk4 | cut -d , -f 1,2,4 | tail -n 1
echo "Number of Women in Top 10 Earners:"
cat wages.csv | grep -v "gender" | sort -t , -nrk4 | head -n 10 | grep -E "female" | wc -l

