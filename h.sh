#! /bin/bash 

f1=( "apple" 5 )
echo ${#fruit[@]}
f2=( "orange" "grapes" )
f3=( "${f1[@]}" "${f2[@]}" )
echo ${f3[@]}
declare -A bike 
bike=( [name]=spenlder [age]=20 [comp]=honda )
echo ${bike[name]} ${bike[comp]}
hi="hello"
echo ${#hi}
if [[ ${hi} == *he* ]]
then 
	echo "it is not "
else
	echo "this is it "
fi

