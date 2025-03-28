# Reverse proxy notes

### What is a reverse proxy?

A reverse proxy is a server that sits in front of web servers and forwards client (e.g. web browser) requests to those web servers. 

![Reverse proxy diagram](https://cf-assets.www.cloudflare.com/slt3lc6tev37/3msJRtqxDysQslvrKvEf8x/f7f54c9a2cad3e4586f58e8e0e305389/reverse_proxy_flow.png)

***Intermediary for requests to backend servers***

### Why implement one?

- ***Load Balancing***: Distributes incoming requests across multiple backend servers to ensure no single server becomes overwhelmed, improving performance and reliability. 
- ***Data compression***: Can also compress data to optimise bandwidth usage. 
- ***Caching***: Can also cache data to reduce load.
- ***Security***: Acts as a barrier to protect backend servers. A web service can hide the IP address of the backend servers which is particularly effective agains a DDos attack (overwhelming the target or its surrounding infrastructure with a flood of Internet traffic).


### How are they different to a forward proxy?

A reverse proxy is a server that sits in front of one or more web servers, intercepting requests from clients. This is different from a forward proxy, where the proxy sits in front of the clients.

A forward proxy is similar to a VPN but without the encryption

![Forward proxy diagram](https://cf-assets.www.cloudflare.com/slt3lc6tev37/2MZmHGnCdYbQBIsZ4V11C6/25b48def8b56b63f7527d6ad65829676/forward_proxy_flow.png)

The main reasons to use a forward proxy are:

- ***To avoid browsing restrictions***
- ***To block access to certain content***
- ***To protect their identity online***: A reverse proxy hides the IP of the servers, a forward proxy hide the IP of the users

### How do they work? Add a diagram if possible

1. ***Client Request***: A client (e.g. a browser) sends a request to a web application
2. ***Reverse Proxy Receives Request***: The request first hits the reverse proxy server. The client doesn't know that it is not directly interacting with the backend server.
3. ***Routing to Backend***: The reverse proxy determines which backend server should handle the request. It might use load balancing algorithms, cache lookup, or other logic to decide.
4. ***Request Forwarded***: The reverse proxy forwards the request to the appropriate backend server.
5. ***Backend Response***: The backend server processes the request and sends the response to the reverse proxy.
6. ***Response to Client***: The reverse proxy sends the response back to the client, effectively masking the details of the backend server.

![diagram 2](https://docs.oracle.com/cd/E19575-01/821-0053/images/revprxy1.gif)

For more diagrams explaining secure proxying see: 
[How Reverse Proxying Works](https://docs.oracle.com/cd/E19575-01/821-0053/adypo/index.html)

# Setting up an instance

- Select Ubuntu Server 22.04 LTS (HVM) as your amazon machine image
- Instance type t2.micro
- If you haven't already done so, create a key pair and add the private key to your local .ssh folder
- In security groups you should have added ports: 3000, 80 and 22
- Connect via an ssh group by pasting the example text into your .ssh folder
- Follow the below steps for implementing a reverse proxy

# Implementing a reverse proxy

See sparta_app_script.sh for initial steps

After nginx install

### What I did maually:
Navigate to the available sites text file

###### Note: this isn't the most efficient method but it works

1. ```cd ..```
2. ```cd ..```
3. ```cd etc```
4. ```cd nginx```
5. ```cd sites-available```
6. ```sudo nano default```
  
   ***(Sudo as otherwise the file is unwritable)***
7. Navigate to:

```
location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 40>
                try_files $uri $uri/ =404;
        }
```
8. Change the location  

Add backend server address.

```proxy_pass http://localhost:3000/;```

i.e.

```
location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 40>
                proxy_pass http://localhost:3000/;
                try_files $uri $uri/ =404;
        }
```


9. Save the changes
10.  cd 
    
This will return you to the home directory where you can continue the steps from the sparta app script

You should then be able to lauch the app through the proxy

Copy and paste you Public IPv4 address into the search bar to test if its working

You will know it works if the App screen apears, not the nginx screen
