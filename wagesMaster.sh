#completes 3 tasks specified in Exercise 6 to sort, report, and compute different combinations of employee statistics
#usage: bash wagesMaster.sh wages.csv


#sorts given file by gender and years experience to show unique combinations in genderYears.txt

cat $1 | grep -E "male" | cut -d, -f1,2 | tr "," " " | sort -k1,1 -k2,2n | uniq > genderYears.txt
echo "See genderYears.txt for sorted list of gender and years of experience"

#returns stats for highest and lowest earners, and reports how many of top 10 earners are female

echo "Stats for Lowest Earner:"
cat $1 | cut -d , -f 1,2,4 | grep -v "gender" | tr "," " " | sort -k3,3n | head -n1
echo "Stats for Highest Earner:"
cat $1 | cut -d , -f 1,2,4 | grep -v "gender" | tr "," " " | sort -k3,3n | tail -n1
echo "Number of Females in Top Ten:"
cat $1 | cut -d , -f 1,2,4 | grep -v "gender" | tr "," " " | sort -k3,3n | tail | grep -E -c "female"


#finds difference in minimum wage between employees with 12 and 16 years of school

echo "Difference in Minimum Wage for Employees With College Degrees:"
year12=$(cat $1 | cut -d, -f3,4 | grep "12," | cut -d, -f2 | sort -n | head -n1)
year16=$(cat $1 | cut -d, -f3,4 | grep "16," | cut -d, -f2 | sort -n | head -n1)
echo "$year16 - $year12" | bc

