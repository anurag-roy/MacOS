#!/bin/bash
#Script to display the color palette of your terminal
#Feel free to customize as you feel 

echo
echo "       Color Scheme: Oceanic Future       " #Hard-coded
echo
Width='      '     # Adjust the width of the blocks by adding or reducing spaces in Width

for Height in 1 2 3      #Adjust the height of the blocks by adding more numbers
  do Heighter=${Height// /}
  for BG in 43m 41m 45m 44m 46m 42m    #Background colors 
    do echo -en " \033[$BG$Width\033[0m"
  done
  echo
done
echo

#40m is Black
#41m is Red
#42m is Green
#43m is Yellow
#44m is Blue
#45m is Pink
#46m is Cyan
#47m is White
