#!/bin/bash

for file in `find html -regextype posix-extended -regex '.*\.html'`; do
echo "converting $file"
    iconv --from-code WINDOWS-1251 --to-code utf-8 "$file" -o "$file.utf-8"
    sed -i 's/charset=windows-1251/charset=utf-8/g' "$file.utf-8"

    html2text -utf8 -style pretty -o "${file%.html}.txt" -width 65536 "$file.utf-8"

    sed -i 's/&mdash;/-/g' "${file%.html}.txt"

    sed -i 's/--------//g' "${file%.html}.txt"

#replace nonbreaking space for UTF
    sed -i 's/\xC2\xA0/ /g' "${file%.html}.txt"

#remove leading and ending whitespace
    sed -i 's/^ *//g' "${file%.html}.txt"
    sed -i 's/ *$//g' "${file%.html}.txt"

#remove double spaces
#    sed -i 's/[ ]*/ /g' "${file%.html}.txt"

    cat "${file%.html}.txt" | tr '\n' '#' > "$file.utf-8"

    mv "$file.utf-8" "${file%.html}.txt"

    sed -i 's/##*/#/g' "${file%.html}.txt"
    sed -i 's/#/\n\n/g' "${file%.html}.txt"

echo "$file done"
done

mv ./html/*.txt ./text