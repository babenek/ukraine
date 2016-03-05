#!/bin/bash

for file in `find text -regextype posix-extended -regex '.*\.txt'`; do
echo "formatting $file"





	
	sed -i 's/[(] [0-9]\{4\}-[0-9]\{2\} [)]//g' "$file"
	
	sed -i 's/[(] v[0-9]\{3\}p[0-9]\{3\}-[0-9]\{2\} [)]//g' "$file"
	
	sed -i 's/[(][^(]*Відомості Верховної Ради України .ВВР., 1996, . 30, ст. 141[^)]*[)]//g' "$file"

    sed -i 's/  */ /g' "$file"

    cat "$file" | tr '\n' '#' > "$file.tmp"

	sed -i 's/{[^}]*}//g' "$file.tmp"
	
	sed -i 's/[(][^(]*Офіційне[^)]*[)]//g' "$file.tmp"
	sed -i 's/[(][^(]*Із змінами[^)]*[)]//g' "$file.tmp"

    sed -i 's/##*/#/g' "$file.tmp"
    sed -i 's/#/\n\n/g' "$file.tmp"

    mv "$file.tmp" "$file"



#remove leading and ending whitespace
    sed -i 's/^ *//g' "$file"
    sed -i 's/ *$//g' "$file"



echo "$file done"
done
