#!/bin/bash

for file in *-std.csv; do
    if [[ $file =~ ^(.).*\.csv$ ]]; then
        first_letter="${BASH_REMATCH[1]}"
        case "$first_letter" in
            c)
                # Process the file
                 
				{ head -n 1 $file; tail -n +2 $file| sort -t ',' -k 5,5 -k 4,4; } > sorted-ditiss.csv
				
				echo "Student file is sorted" 

				cut -d "," -f 2 c-lock.csv | paste sorted-ditiss.csv -  > ditiss-locker.csv
				
				echo "ditiss locker allocation is done"
				
				cat ditiss.csv

				awk 'BEGIN {FS=OFS=","} NR>1 {$1=NR-1} 1' ditiss-locker.csv > temp && mv temp ditiss.csv

				echo "Find the final file ditiss.csv for your reference" 

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
#!/bin/bash






