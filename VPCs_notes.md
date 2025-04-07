# VPCs Notes

[What is Amazon VPC?](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)

[Amazon VPC documentation](https://docs.aws.amazon.com/vpc/#:~:text=Amazon%20Virtual%20Private%20Cloud%20(Amazon,network%20that%20you've%20defined.))

### What are VPCs and how do they work? 

***VPC*** (Virtual private cloud): A private, isolated network within a public cloud infrastructure that allows an organization to isolate and control its own resources and network infrastructure.

***Representation of VPC within the public cloud***

![alt text](./Images/VPC.png)

***Representation of a VPC and its resources in AWS***

![image](https://docs.aws.amazon.com/images/vpc/latest/userguide/images/vpc-resource-map-update.PNG)

### How do VPCs help a business?

- ***Security***: VPCs provide a secure, isolated network environment within the public cloud. Businesses can ensure that their resources are protected from other users of the cloud.
- ***Flexibility***: 
  - Allow for custom network architecture
  - Make it easier to set up hybrid cloud integrations
- ***Scalability***: 
- ***Cost efficiency***:
- ***All the same benifits of other cloud comuting services***

From [Amazon](https://aws.amazon.com/vpc/):
- ***Increase security***: Secure and monitor connections, screen traffic, and restrict instance access inside your virtual network
- ***Save time***: Spend less time setting up, managing, and validating your virtual network
- ***Manage and control your environment***: Customize your virtual network by choosing your own IP address range, creating subnets, and configuring route tables 

### How do they help with DevOPs?

- ***Separation of Environments***: In a VPC, you can create separate subnets for different stages of the application lifecycle, such as development, testing, and production
- ***CI/CD***: Provide the network infrastructure necessary to deploy applications in a secure and isolated environment
- ***Containerization***: VPCs can provide a secure network for managing containerized applications
- ***Scalability***: Auto-scaling
- ***Monitoring***: Can use monitoring tools like Cloudwatch
- ***Consistency Across Environments***: DevOps teams can easily replicate production-like environments in staging and testing environments, reducing the risk of deployment failures. This makes it easier to run automated tests and perform integration testing before pushing changes to production.

### Why did AWS feel the need to introduce VPCs?

[Introducing Amazon VPC](https://aws.amazon.com/about-aws/whats-new/2009/08/26/introducing-amazon-virtual-private-cloud/)

"Amazon Virtual Private Cloud (Amazon VPC) is a secure and seamless bridge between a company’s existing IT infrastructure and the AWS cloud. Amazon VPC enables enterprises to connect their existing infrastructure to a set of isolated AWS compute resources via a Virtual Private Network (VPN) connection, and to extend their existing management capabilities such as security services, firewalls, and intrusion detection systems to include their AWS resources."

### Components:

- ***Subnets***: You can divide a VPC into subnets to organize and isolate resources based on various requirements
- ***Public vs Private Subnets***
  - ***Public***: Has direct access to the internet. Resources in a public subnet can communicate with the internet using an Internet Gateway (IGW)
  - ***Private***: Isolated from direct internet access. Typically don't have public IP addresses. Route traffic through a NAT Gateway or NAT instance to allow outbound internet access
- ***[CIDR](https://aws.amazon.com/what-is/cidr/#:~:text=CIDR%20notation%20represents%20an%20IP,bit%20network%20identifier%20as%20192.168.) Blocks*** (Classless Inter-Domain Routing) block: 
  - Used to define the range of IP addresses available within a VPC or subnet
  - ***Notation***: CIDR notation represents an IP address and a suffix that indicates network identifier bits in a specified format. For example, you could express ```192.168.1.0``` with a 22-bit network identifier as ```192.168.1.0/22```
![CIDR](https://d2908q01vomqb2.cloudfront.net/cb4e5208b4cd87268b208e49452ed6e89a68e0b8/2016/10/25/VPC_Image2.png)
- ***Internet Gateways***: Allows communication between instances in your VPC and the internet
- ***Route Table/s***: A set of rules (called routes) used to determine where network traffic from your VPC is directed
- ***SG*** (Security group): 
  - Virtual firewalls used to control inbound and outbound traffic to AWS resources
  - How SGs work on an INSTANCE level: A security group is associated with an instance

