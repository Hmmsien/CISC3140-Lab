BEGIN {
FS = ","
OFS = ","
print "Car_ID, Year, Make, Model, Name, Email" > "output/Cars_Info.csv"
print "Judge_ID, Judge_Name" > "output/Judges.csv"
print "Car_ID, Car_Score" > "output/Car_Score.csv"
}
{
if(NR>1){
total =0;
for(i=10; i<= NF;i++){
total+=$i
}
print $7, total  > "output/Car_Score.csv"
print  $8, $9  > "output/Judges.csv"
print $7, $4, $5, $6, $3, $2  > "output/Cars_Info.csv"
}
}
END{
}
