#!/bin/bash
read -p "Enter number of times to flip a combination:" no_of_flips
echo "---------------------------SINGLET-COMBINATION---------------------------"
declare -A singlet_frequency=( 

                                [H]=0
                                [T]=0

                              )
for(( flip = 1; flip <= no_of_flips; flip++ ))
do
    echo -n "Flip-$flip is "
    (( coin = RANDOM % 2 ))
    case $coin in 
        0)
            echo "Heads"
            (( singlet_frequency[H]++ ))
            ;;
        1)
            echo "Tails"
            (( singlet_frequency[T]++ ))
    esac
done

for combination in ${!singlet_frequency[@]}
do
    #update count values  with corresponding percentage
    percentage=$(( ${singlet_frequency[$combination]}  * 100 / no_of_flips ))
    singlet_frequency[$combination]=$percentage
    echo "percentage of $combination is ${singlet_frequency[$combination]}%"   
done

echo "---------------------------DOUBLET-COMBINATION---------------------------"
declare -A doublet_frequency=( 

                                [HH]=0
                                [HT]=0
                                [TH]=0
                                [TT]=0

                              )

for(( flip = 1; flip <= no_of_flips; flip++ ))
do
    echo -n "Flip-$flip is "
    (( coin_1 = RANDOM % 2 ))
    (( coin_2 = RANDOM % 2 ))

    #0 is mapped as heads
    #1 is mappes as tails
    case $coin_1$coin_2 in 
        00)
            echo "Heads Heads"
            (( doublet_frequency[HH]++ )) 
            ;;
        01)
            echo "Heads Tails"
            (( doublet_frequency[HT]++ ))
            ;;
        10)
            echo "Tails Heads"
            (( doublet_frequency[TH]++ ))
            ;;
        11)
            echo "Tails Tails"
            (( doublet_frequency[TT]++ ))
            ;;
    esac
done

for combination in ${!doublet_frequency[@]}
do
    #update count values  with corresponding percentage
    percentage=$(( ${doublet_frequency[$combination]}  * 100 / no_of_flips ))
    doublet_frequency[$combination]=$percentage
    echo "percentage of $combination is ${doublet_frequency[$combination]}%"   
done
