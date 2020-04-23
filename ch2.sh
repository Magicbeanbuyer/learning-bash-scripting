name=magicbeanbuyer

# () are special chars
echo hi $name, world \(planet\)!
# hi magicbeanbuyer, world (planet)!

# '' strong quote, print literal string, no interpretation
echo 'hi $name, world (planet)!'
#hi $name, world (planet)!

echo "hi $name, world (planet)!"
# hi magicbeanbuyer, world (planet)!

echo "hi \$name, world (planet)!"
#hi $name, world (planet)!

# declare integer
declare -i d=123

# declare read-only
declare -r e=123

# lower case, `-u` upper case
declare -l a=AaBb
echo $a
# aabb

echo $PWD
echo $HOME
echo $MACHTYPE
echo $HOSTNAME # thinkpad

# length of current bash session
# counts the beginning of a script
echo $SECONDS

# name of a script
echo $0
# /bin/bash
./my.sh
# ./my.sh
# auth.log  ch1.sh  ch2.sh  challenges  error.txt  fruit  my.sh  otherfolder  pets  success.txt  trees

############################
### command substitution ###
############################
# $()
poke_google=$(ping -c 2 google.com | grep 'bytes from' | cut -d = -f 4)
echo $poke_google


# $(()) for math operations
c=2
u=$((c+2))
echo $u

# [[]] for comparision
[[ "cat" == "cat" ]]
echo $?
# 0 success
[[ "cat" != "cat" ]]
echo $?

# for integer `-lt` less than
[[ 20 -lt 100 ]]
echo $?

# string concatination & slicing
a="it is "
b="a good day"
c=$a$b
d=${c:3:4}
echo $c
echo $d

date
