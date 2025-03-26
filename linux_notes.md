# Linux notes

## Command list

```uname``` = gives system info

```uname --help``` = give options of what you can do with uname

```history``` = show all commands from this session

```history -c``` = clears history

```whoami``` = tells you who you are logged in as

```cat /etc/shells``` = tells you available shells on the system

```ps -p $$``` = tells you the shell you are currently using

```ls -al``` = still works

```curl <link> --output cat <name_file>``` = lets you download and name a file

```wget <link> -o <name_file>``` = same as above

```file <filename>``` = gives info about file. Works regardless of extension. i.e. if you rename a .jpg to a .txt it still recognises it as a .jpg

```mv <filename>``` = rename

```cp <filename> <new_file_name>``` = copy

```rm <filename>``` = remove

```rm -r <directory name>``` = remove directory

```mkdir <new_directory_name>``` = make directory

```touch <.txt file>``` = creates an empty text file

```nano <text file>``` = opens text editor

```head -x <filename>``` = prints first x lines

```tail -x <filename>``` = prints last x lines

```nl``` = prints with numbered lines

```cat <filename> | grep <word>``` = only prints the lines containing desired word

```sudo apt update -y``` = downloads new packages

```sudo apt install tree``` = installs them

```tree``` = different way of displaying what files are in the directory

```sudo apt upgrade -y``` = 

```sudo su``` = become root user

allows you to enter the root directory

```mv <file> <directory>/``` = move file to directory

``` mv ./funny-stuff/chicken-joke.txt .``` = move out of directory to current directory

```man <command>``` = gives the manual explaining a command

```sudo apt install nginx - y``` 

```sudo systemctl status nginx```