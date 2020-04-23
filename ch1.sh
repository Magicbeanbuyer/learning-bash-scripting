echo $BASH_VERSION

tree -C
# .
# ├── auth.log
# ├── ch1.sh
# ├── challenges
# │   ├── 20131018_report.log
# │   ├── ch2_challenge.sh
# │   ├── ch2_solution.sh
# │   ├── ch4_challenge.sh
# │   └── ch4_solution.sh
# ├── fruit
#
# ├── pets
# └── trees
#     ├── cedar
#     ├── maple.txt
#     ├── pine.txt
#     ├── spruce
#     ├── sycamore
#     └── tree.png

# `-l` indicates files and folders, `d` in `drwxr-xr-x` indicates directory
ls -l
# drwxr-xr-x 2 usr usr  4096 Okt 18  2013 cedar
# -rw-r--r-- 1 usr usr 12644 Okt 18  2013 maple.txt

mkdir
rmdir

# copy past file
cp maple.txt new_maple.txt

# `cat` only usable for text
cat pine.txt
cat tree.png

# `more` paginate a file
more pine.txt
q # to exit `more`

head pine.txt
tail pine.txt

##################
### EXPANSIONS ###
##################

# tilde expansion: user's home variable
echo ~
# /home/usr

# brace expansion: repeat command

touch file_{1..100}
# file_1 file_10 file_100 file_11
touch file_{01..100}
# file_001 file_002 file_003
echo {1..10}
#1 2 3 4 5 6 7 8 9 10
echo {1..10..3}
#1 4 7 10
echo {a..z}
#a b c d e f g h i j k l m n o p q r s t u v w x y z
echo {a..Z}
#a ` _ ^ ]  [ Z
echo {A..z}
#A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [  ] ^ _ ` a b c d e f g h i j k l m n o p q r s t u v w x y z
echo {a..k..2}
#a c e g i k
touch {a..c}_{1..5}
#a_1  a_2  a_3  a_4  a_5  b_1  b_2  b_3  b_4  b_5  c_1  c_2  c_3  c_4  c_5

# `|` pipe, `wc` word count `-l` line count
ls -l | wc -l
# 16 instead of 15 because of first line "total 0"

touch {a..e}_{01..100}
ls | more

# .. parent dir
mkdir ../otherfolder

# chmod command sets the permissions of files or directories.
# remove read access to folders
chmod 000 *_015*

# `-v` verbose 冗长的；啰嗦的
cp -v * ../otherfolder
# 'e_015' -> '../otherfolder/e_015'
# cp: cannot open 'e_015' for reading: Permission denied

# 1 standard output
# 2 standard error
# & both standard output and error
# >../success.txt redirect output to /home/usr/Documents/Learning Bash Scripting/success.txt
cp -v * ../otherfolder 1>../success.txt 2>../error.txt

# > /dev/null redirect output to the great blue nowhere
ls > /dev/null

#search for a string in a file
grep scott auth.log

# `-i` case insensitive
grep -i break-in auth.log

# 1. AWK Operations:
# (a) Scans a file line by line
# (b) Splits each input line into fields
# (c) Compares input line/fields to pattern
# (d) Performs action(s) on matched lines
# print the 12th string
grep -i break-in auth.log | awk {'print $12'}
# Oct 15 19:11:52 localhost sshd[4220]: reverse mapping checking getaddrinfo for 172.25.200.11.rdns.example.com [172.25.200.11] failed - POSSIBLE BREAK-IN ATTEMPT!
#[172.25.200.11]

#Ping is a computer network administration software utility used to test the reachability of a host on an Internet Protocol network.
ping google.com

# `-c` poke the link twice
# `cut` split a string
# `-d` delimiter
# `-f` field
ping -c 2 google.com | grep 'bytes from' | cut -d = -f 4

# to execute a script
bash my.sh

# -rw-r--r-- 1 xiatong xiatong      23 Apr 23 14:19 my.sh
./my.sh
# bash: ./my.sh: Permission denied

# `chmod` change mode (of access)
chmod +x my.sh
# -rwxr-xr-x 1 xiatong xiatong      23 Apr 23 14:19 my.sh

# add a script /usr/bin
sudo cp my.sh /usr/bin
my.sh
sudo rm /usr/bin/my.sh
