#!/bin/bash

cd raw-data/

for i in *students.csv
do
	
	if [ "$i" == "ditiss-students.csv" ]
	then
		cut -d "," -f1,2,5,12,14 $i > c-std.csv
		sleep 2
		echo "ditiss file ready..."
	elif [ "$i" == "dac-students.csv" ]
	then
		cut -d "," -f1,2,5,12,14 $i > d-std.csv
		echo "dac file ready..."
		sleep 2
	elif [ "$i" == "dmc-students.csv" ]
	then
		cut -d "," -f1,2,5,12,14 $i > w-std.csv
		echo "dmc file ready..."
		sleep 2
	elif [ "$i" == "desd-students.csv" ]
	then
		cut -d "," -f1,2,5,12,14 $i > e-std.csv
		echo "desd file ready..."
		sleep 2
	elif [ "$i" == "dbda-students.csv" ]
	then
		cut -d "," -f1,2,5,12,14 $i > b-std.csv
		echo "dbda file ready..."
		sleep 2
	fi
		
done



for file in *-std.csv; do
    if [[ $file =~ ^(.).*\.csv$ ]]; then
        first_letter="${BASH_REMATCH[1]}"
        case "$first_letter" in
            c)
                # Process the file
                 
				{ head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > _sorted-ditiss.csv
				sleep 2
				echo "Student file is sorted"
				c_lines=$(wc -l $file | cut -d " " -f1)

				 
				
				sed 's/$/,/' _sorted-ditiss.csv > temp && mv temp _ditiss-to-merge.csv
				
				echo "comma is added at the end" 

				cut -d "," -f 2 c-lock.csv | paste -d '' _ditiss-to-merge.csv -  > _ditiss-locker.csv
				sleep 2
				echo "ditiss locker allocation is done"
				
				

				awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' _ditiss-locker.csv > temp && mv temp _ditiss.csv

				echo "Find the final file ditiss.csv for your reference" 

				sed -i "1s/username/RollNo/" _ditiss.csv
				sed -i "1s/Sr. No./Sr.No./" _ditiss.csv
				sed -i "1s/lastname/Name/" _ditiss.csv
				sed -i "1s/department/Group/" _ditiss.csv

				
				head -$c_lines _ditiss.csv > ditiss.csv 
				
				mv ditiss.csv ../student_allocation_data
				sleep 2
				echo "ditiss.csv file is copied to required directory ( student_allocation_data )" 
				

                ;;
            d)
                { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > _sorted-dac.csv
				
				echo "Student file is sorted" 
				
				d_lines=$(wc -l $file | cut -d " " -f1)
				
			sed 's/$/,/' _sorted-dac.csv > temp && mv temp _dac-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 2 
			
			cut -d "," -f 2 d-lock.csv | paste -d '' _dac-to-merge.csv -  > _dac-locker.csv
				
				echo "dac locker allocation is done"
				
				sleep 2 
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' _dac-locker.csv > temp && mv temp _dac.csv

			echo "Find the final file dac.csv for your reference" 
			
			sleep 2
				sed -i "1s/username/RollNo/" _dac.csv
				sed -i "1s/Sr. No./Sr.No./" _dac.csv
				sed -i "1s/lastname/Name/" _dac.csv
				sed -i "1s/department/Group/" _dac.csv
			
			head -$d_lines _dac.csv > dac.csv
			
			mv dac.csv ../student_allocation_data/
				
			echo "dac.csv file is copied to required directory ( student_allocation_data )"		
				
                ;;
            e)
               { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > _sorted-desd.csv
				
				echo "Student file is sorted" 
				
				e_lines=$(wc -l $file | cut -d " " -f1)
				
			sed 's/$/,/' _sorted-desd.csv > temp && mv temp _desd-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 2
			
			cut -d "," -f 2 e-lock.csv | paste -d '' _desd-to-merge.csv -  > _desd-locker.csv
				
				echo "desd locker allocation is done"
				
				sleep 2 
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' _desd-locker.csv > temp && mv temp _desd.csv

			echo "Find the final file desd.csv for your reference" 
			
			sleep 2
				sed -i "1s/username/RollNo/" _desd.csv
				sed -i "1s/Sr. No./Sr.No./" _desd.csv
				sed -i "1s/lastname/Name/" _desd.csv
				sed -i "1s/department/Group/" _desd.csv
			
			head -$e_lines _desd.csv > desd.csv
			
			mv desd.csv ../student_allocation_data
				
			echo "desd.csv file is copied to required directory ( student_allocation_data )"	
                ;;
            w)
                 { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > _sorted-dmc.csv
				
				echo "Student file is sorted" 
				
				w_lines=$( wc -l $file | cut -d " " -f1)
				
			sed 's/$/,/' _sorted-dmc.csv > temp && mv temp _dmc-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 2 
			
			cut -d "," -f 2 w-lock.csv | paste -d '' _dmc-to-merge.csv -  > _dmc-locker.csv
				
				echo "dmc locker allocation is done"
				
				sleep 2 
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' _dmc-locker.csv > temp && mv temp _dmc.csv

			echo "Find the final file dmc.csv for your reference" 
			
			sleep 2
				sed -i "1s/username/RollNo/" _dmc.csv
				sed -i "1s/Sr. No./Sr.No./" _dmc.csv
				sed -i "1s/lastname/Name/" _dmc.csv
				sed -i "1s/department/Group/" _dmc.csv
			
			head -$w_lines _dmc.csv > dmc.csv
			
			mv dmc.csv ../student_allocation_data
				
			echo "dmc.csv file is copied to required directory ( student_allocation_data )"	
                ;;
            b)
                { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > _sorted-dbda.csv
				
				echo "Student file is sorted" 
				
				
				b_lines=$( wc -l $file | cut -d " " -f1)
				
			sed 's/$/,/' _sorted-dbda.csv > temp && mv temp _dbda-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 2 
			
			cut -d "," -f 2 b-lock.csv | paste -d '' _dbda-to-merge.csv -  > _dbda-locker.csv
				
				echo "dbda locker allocation is done"
				
				sleep 2
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' _dbda-locker.csv > temp && mv temp _dbda.csv

			echo "Find the final file dbda.csv for your reference" 
			
			sleep 2
				sed -i "1s/username/RollNo/" _dbda.csv
				sed -i "1s/Sr. No./Sr.No./" _dbda.csv
				sed -i "1s/lastname/Name/" _dbda.csv
				sed -i "1s/department/Group/" _dbda.csv
			
			head -$b_lines _dbda.csv > dbda.csv
			
			mv dbda.csv ../student_allocation_data
				
			echo "dbda.csv file is copied to required directory ( student_allocation_data )"	
                ;;
            *)
                echo "Unknown starting letter: $first_letter for file: $file"
                ;;
        esac
    else
        echo "Invalid file name format: $file"
    fi
done




rm _*





