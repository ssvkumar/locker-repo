#!/bin/bash

for file in *-std.csv; do
    if [[ $file =~ ^(.).*\.csv$ ]]; then
        first_letter="${BASH_REMATCH[1]}"
        case "$first_letter" in
            c)
                # Process the file
                 
				{ head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > sorted-ditiss.csv
				
				echo "Student file is sorted" 
				
				sed 's/$/,/' sorted-ditiss.csv > temp && mv temp ditiss-to-merge.csv
				
				echo "comma is added at the end" 

				cut -d "," -f 2 c-lock.csv | paste -d '' ditiss-to-merge.csv -  > ditiss-locker.csv
				
				echo "ditiss locker allocation is done"
				

				awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' ditiss-locker.csv > temp && mv temp ditiss.csv

				echo "Find the final file ditiss.csv for your reference" 
				
				cp ditiss.csv student_allocation_data
				
				echo "ditiss.csv file is copied to required directory ( student_allocation_data )" 

                ;;
            d)
                { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > sorted-dac.csv
				
				echo "Student file is sorted" 
			sed 's/$/,/' sorted-dac.csv > temp && mv temp dac-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 5 
			
			cut -d "," -f 2 d-lock.csv | paste -d '' dac-to-merge.csv -  > dac-locker.csv
				
				echo "dac locker allocation is done"
				
				sleep 5 
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' dac-locker.csv > temp && mv temp dac.csv

			echo "Find the final file dac.csv for your reference" 
			
			sleep 5 
			
			cp dac.csv student_allocation_data
				
			echo "dac.csv file is copied to required directory ( student_allocation_data )"		
				
                ;;
            e)
               { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > sorted-desd.csv
				
				echo "Student file is sorted" 
			sed 's/$/,/' sorted-desd.csv > temp && mv temp desd-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 5 
			
			cut -d "," -f 2 e-lock.csv | paste -d '' desd-to-merge.csv -  > desd-locker.csv
				
				echo "desd locker allocation is done"
				
				sleep 5 
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' desd-locker.csv > temp && mv temp desd.csv

			echo "Find the final file desd.csv for your reference" 
			
			sleep 5 
			
			cp desd.csv student_allocation_data
				
			echo "desd.csv file is copied to required directory ( student_allocation_data )"	
                ;;
            w)
                 { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > sorted-dmc.csv
				
				echo "Student file is sorted" 
			sed 's/$/,/' sorted-dmc.csv > temp && mv temp dmc-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 5 
			
			cut -d "," -f 2 w-lock.csv | paste -d '' dmc-to-merge.csv -  > dmc-locker.csv
				
				echo "dmc locker allocation is done"
				
				sleep 5 
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' dmc-locker.csv > temp && mv temp dmc.csv

			echo "Find the final file dmc.csv for your reference" 
			
			sleep 5 
			
			cp dmc.csv student_allocation_data
				
			echo "dmc.csv file is copied to required directory ( student_allocation_data )"	
                ;;
            b)
                { head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > sorted-dbda.csv
				
				echo "Student file is sorted" 
			sed 's/$/,/' sorted-dbda.csv > temp && mv temp dbda-to-merge.csv
				
			echo "comma is added at the end" 
			sleep 5 
			
			cut -d "," -f 2 b-lock.csv | paste -d '' dbda-to-merge.csv -  > dbda-locker.csv
				
				echo "dbda locker allocation is done"
				
				sleep 5 
				
			awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' dbda-locker.csv > temp && mv temp dbda.csv

			echo "Find the final file dbda.csv for your reference" 
			
			sleep 5 
			
			cp dbda.csv student_allocation_data
				
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






