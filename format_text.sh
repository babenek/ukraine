#!/bin/bash

for file in `find text -regextype posix-extended -regex '.*\.txt'`; do
echo "formatting $file"


    sed -i 's/Карта_сайту | Адміністратор//g' "$file"
    sed -i 's/Програмно-технологічна підтримка - Управлiння комп.ютеризованих систем.//g' "$file"
    sed -i 's/© 1994 При використанні даних обов.язкове посилання на сайт Верховної Ради України//g' "$file"
    sed -i 's/_На_головну_//g' "$file"
    sed -i 's/Друкувати.*Шрифт.*збільшити.*зменшити.*//g' "$file"
    sed -i 's/Увага! .* - Це не поточна редакція документу. Перейти_до_поточної?//g' "$file"


    sed -i 's/Р о з д і л/Розділ/g' "$file"

    sed -i 's/Г л а в а/Глава/g' "$file"

    sed -i 's/П О С Т А Н О В А/ПОСТАНОВА/g' "$file"

    sed -i 's/К О Н С Т И Т У Ц І Я/КОНСТИТУЦІЯ/g' "$file"

    sed -i 's/^\* //g' "$file"

    sed -i 's/Стаття \([0-9]*\)\. /Стаття \1.\n\n/g' "$file"

    sed -i "s/’/\'/g" "$file"

    sed -i 's/^o /* /g' "$file"

    sed -i 's/N/№/g' "$file"

    sed -i 's/  */ /g' "$file"

    cat "$file" | tr '\n' '#' > "$file.tmp"

    sed -i 's/##*/#/g' "$file.tmp"
    sed -i 's/#/\n\n/g' "$file.tmp"

    mv "$file.tmp" "$file"

echo "$file done"
done
