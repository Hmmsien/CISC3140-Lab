BEGIN {
FS = ","
OFS = ","
print "Car_ID, Year, Make, Model, Name, Email" > "Cars_Info.csv"
print "Judge_ID, Judge_Name" > "Judges.csv"
print "Car_ID, Car_Score" > "Car_Score.csv"
}
{
if(NR>1){
total =0;
for(i=10; i<= NF;i++){
total+=$i
}
print $7, total  > "Car_Score.csv"
print  $8, $9  > "Judges.csv"
print $7, $4, $5, $6, $3, $2  > "Cars_Info.csv"
}
}
END{
}
