# Linux/Bash research task

### How can we set a variable in BASH?

To set a variable only for the current shell we use

```<variable_name>=<value>```

Then to call the variable value

```$variable```


### What are environment variables?

An environment variable is a ***variable whose value is set outside the program***, typically through functionality built into the operating system or microservice. An environment variable is made up of a name/value pair.

***Used by a shell and its child processes.***

- Environment variables follow ```<NAME>=<VALUE>``` formatting.
- You can specify multiple values for a single variable by separating them with colons like this: ```<NAME>=<VALUE1>:<VALUE2>:<VALUE3>```
- Environment variables are case-sensitive.
- By convention, environment variable names are always capitalized.
- Shell variables are not the same as environment variables. Shell variables only apply to the current shell, not any child processes.

### How can we set one?

```export <variable_name>=<value>```

### How can you make an environment variable persistent?

There are 3 main ways which serve different perposes:

1. ***Use .profile to Make Environment Variables Permanent for Login Shells***

###### Note: A login shell is the first process that executes under your user ID when you log in for an interactive session.

- Change directory to the user’s home directory ```cd ~```
- Open ```.profile``` file in a text editor (e.g. nano)
- Add the following line to the bottom of the file: ```export <variable_name>=<value>```
- Save the changes

1. ***Use .bashrc to Make Environment Variables Permanent for Non-login Interactive Shells***

- Do the same but with a ```.bashrc``` file

3. ***Use /etc/environment to Make Environment Variables Permanent System-wide***

- Change directory to the ```/ect``` directory: ```cd /etc```
- Open environment file in a text editor (e.g. nano): ```nano <filename>```
- Add the following line to the bottom of the file ```<variable_name>=<value>```
- Save the changes

For more details see: [Environment variables](https://www.cherryservers.com/blog/how-to-set-list-and-manage-linux-environment-variables)

### What is a process?

***A program currently being executed***

### How can we see running processes?

- ```ps aux``` shows all running processes.

- ```top``` provides an interactive view of the running processes, updating in real time.


### What are child processes?

- Child processes are ***processes that are created by a parent process***. 
- Child processes inherit resources and environment variables from their parent processes.

e.g. A game is a child process of the steam client

### How can you run a process in the background, rather than the foreground?

To run a process in the background, append ```&``` to the command:

```<command> &```

### How can you end a process?

You can end a process by using the ```kill``` command followed by the process ID (PID). You can find the PID using ```ps``` or ```top```:

```kill <PID>```

or 

To forcefully terminate it (like end task in task manager):

```kill -9 <PID>```

or

***Pressing ctrl+c in the terminal kills all foreground processes***

### Explain the Linux permission system to me

***There are three main types of permissions***:

- ***Read (r)***: Allows the user to read the contents of a file or list a directory's contents.
- ***Write (w)***: Allows the user to modify or delete a file or add/remove files in a directory.
- ***Execute (x)***: Allows the user to execute a file or access a directory.

***Permissions are set for three types of users***:

- ***Owner (u)***: The user who owns the file or directory.
- ***Group (g)***: A collection of users who are granted the same permissions
- ***Others (o)***: All other users who are neither the owner nor part of the group.

### Explain the shorthand permission system (numbers)

***Octal notation***:

- ***Read (r)*** = 4
- ***Write (w)*** = 2
- ***Execute (x)*** = 1
- ***No permissions*** = 0

If you have multiple permissions just add the numbers

***e.g. 740***

- Owner has all permissions
- Group can read only
- Other has no permissions


### How can you change the permissions on a file?

***Symbolic notation example***

```chmod u+w <filename>```

This would add (+) write (w) permissions to the owner (u).

***Octal notation example***

```chmod 754 <filename>```

- Gives owner read, write and execute permissions
- Gives group read and execute permissions
- Gives other read permissions