#!bin/sh
#usage: bash wages.sh
#Logan Thayer and Diane Lee's script








echo "gender,yearsExperience,yearsSchool,wage"
echo "Highest Earner"
cat wages.csv | grep -v "gender" | sort -t , -nrk4 | cut -d , -f 1,2,4 | head -n 1
echo "Lowest Earner"
cat wages.csv | grep -v "gender" | sort -t , -nrk4 | cut -d , -f 1,2,4 | tail -n 1
echo "Number of Women in Top 10 Earners:"
cat wages.csv | grep -v "gender" | sort -t , -nrk4 | head -n 10 | grep -E "female" | wc -l
