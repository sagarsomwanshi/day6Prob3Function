#!/bin/bash -x
echo "Press 1 to Enter Temp in *C "
echo "press 2 to enter Temparature in *F"
read -p " " c
result=0

function degToFahrn(){
                        fahrenheit=$(( $(awk 'BEGIN {print '$1' * '1.8'}') + 32 ))
                        echo $fahrenheit
}

function fahrnToDeg(){
                        degree=$(awk 'BEGIN {print '$(( $1 - 32 ))' * '$(awk 'BEGIN {print '5' / '9'}')'}' )
                        echo $degree
}


case $c in
	1)
		read -p "Enter The Temprature in *C : " d
		if(( (($d>=0)) && (($d<=100)) ))
		then
			result=$( degToFahrn $((d)) )
		else
			echo " Invalid Temprature value "
			echo " Enter Temparature value in between 0-100 *c "
		fi								;;
	2)
		read -p "Enter The Temprature in *F : " d
                if(( (($d>=32)) && (($d<=212)) ))
                then
                        result=$( fahrnToDeg $((d)) )
                else
                        echo " Invalid Temprature value "
                        echo " Enter Temparature value in between 0-212 *F "
                fi                                                              ;;
	*)
		echo "Invalid Input" ;;
esac


if((c==1))
then
	echo "Temparature in Fahrenheit : $result "
else
	echo "Temparature in Degree : $result "
fi

