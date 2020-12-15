# SCRIPT TO ADD NEW PHRASES
# move the existing phrases in old_phrases.txt
# store the new phrases in phrases.txt The script automatically handles whitespaces
# and also searches for duplicates and removes them. The remaining phrases, both
# old and new are then stored in a .json file with a unique id as value.

# remove old entries
rm phrases.json
rm sorted.txt

# get all old phrases
jq 'keys' old_phrases.json > tmp.txt
cat tmp.txt | tr -d ",[]" > old_phrases.txt
sed -i '/^$/d' old_phrases.txt
sed -i 's/^[ \t]*//;s/[ \t]*$//' old_phrases.txt
rm tmp.txt
sed -i 's/^[ \t]*//;s/[ \t]*$//' phrases.txt

# merge current .txt files
cat *.txt > all_phrases.txt

# process new phrases
sed -i '/^$/d' all_phrases.txt
sort all_phrases.txt | uniq > sorted.txt

# make .json
input="sorted.txt"
cnt=1
START_J="{"
END_J="}"
COMMA_J=","
NLINE="\n"
N_LINES=$(sed -n '$=' sorted.txt)
while read -r line
do 
    if [ "$cnt" -eq "1" ]
    then
        new_line="${START_J} ${line}"
    else
        new_line="${line}"
    fi
    
    if [ "$cnt" -eq "$N_LINES" ]
    then
        new_line="${line}: ${cnt}${END_J}"
    else
        new_line="${new_line}: ${cnt}${COMMA_J}"
    fi

    json_file+="${new_line}"
    echo $new_line
    ((cnt+=1))
done < "$input"
echo $json_file >> phrases.json
json_reformat < phrases.json
