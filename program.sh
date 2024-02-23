#!/bin/bash

for file in *-std.csv; do
    if [[ $file =~ ^(.).*\.csv$ ]]; then
        first_letter="${BASH_REMATCH[1]}"
        case "$first_letter" in
            c)
                # Process the file
                 
				{ head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > sorted-ditiss.csv
				
				echo "Student file is sorted" 
				
				sed 's/$/,"/' sorted-ditiss.csv > temp && mv temp ditiss-to-merge.csv
				
				echo "comma is added at the end" 

				cut -d "," -f 2 c-lock.csv | paste ditiss-to-merge.csv -  > ditiss-locker.csv
				
				echo "ditiss locker allocation is done"
				

				awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' ditiss-locker.csv > temp && mv temp ditiss.csv

				echo "Find the final file ditiss.csv for your reference" 
				
				cp ditiss.csv student_allocation_data
				
				echo "ditiss.csv file is copied to required directory ( student_allocation_data )" 

                ;;
            d)
                # Process the file
                # Assuming processing involves some other action
                echo "Processing $file"
                ;;
            e)
                # Process the file
                # Assuming processing involves some other action
                echo "Processing $file"
                ;;
            w)
                # Process the file
                # Assuming processing involves some other action
                echo "Processing $file"
                ;;
            b)
                # Process the file
                # Assuming processing involves some other action
                echo "Processing $file"
                ;;
            *)
                echo "Unknown starting letter: $first_letter for file: $file"
                ;;
        esac
    else
        echo "Invalid file name format: $file"
    fi
done






