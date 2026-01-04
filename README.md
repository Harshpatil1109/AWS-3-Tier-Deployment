# AWS-3-Tier-Deployment
How to Run This Project (The Step-by-Step)
To build a 3-tier architecture, you divide your resources into Public, Private, and Data layers.

1. Networking (VPC & Connectivity)
VPC: Create a VPC (e.g., 10.0.0.0/16).

Subnets: Create 6 subnets across 2 Availability Zones (AZs):

2 Public (for ALB/NAT Gateway)

2 Private (for WordPress EC2 instances)

2 Private (for RDS Database)

Gateways: Attach an Internet Gateway (IGW) to the public subnets and a NAT Gateway to allow private instances to download WordPress updates.

2. Database Tier (RDS)
Deploy an Amazon RDS (MySQL or Aurora) instance in the Data Tier subnets.

Security Group: Allow inbound traffic on port 3306 ONLY from the Web Tier Security Group.

3. Application Tier (EC2 & WordPress)
Launch an EC2 instance (Amazon Linux 2) in the Private Subnet.

User Data Script: Use a script to install Apache, PHP, and download WordPress.

EFS (Optional but Recommended): Use Amazon EFS to store WordPress media files so multiple EC2 instances can share the same data.

4. Presentation Tier (ALB & Auto Scaling)
Application Load Balancer (ALB): Place this in the Public Subnets to receive internet traffic.

Auto Scaling Group (ASG): Create a launch template from your EC2 instance and set the ASG to maintain at least 2 instances across different AZs.


#AWS 3-Tier Scalable WordPress Deployment

## 📌 Overview
This project demonstrates a production-ready, highly available 3-tier architecture on AWS to host a WordPress website. By separating the web, application, and database layers, we ensure maximum security and scalability.

## 🏗️ Architecture
- **Public Tier:** Application Load Balancer (ALB) and NAT Gateway.
- **Application Tier:** WordPress running on EC2 instances within private subnets.
- **Database Tier:** Managed Amazon RDS (MySQL) for data persistence.

<img width="1140" height="828" alt="AWS 3 Tier WordPress Architecture Diagram drawio" src="https://github.com/user-attachments/assets/29345218-17d8-4621-908a-5161b57e3340" />



## 🛠️ Tools & Technologies
- **Networking:** VPC, Subnets (Public/Private), Route Tables, IGW, NAT Gateway.
- **Compute:** EC2, Auto Scaling Group (ASG).
- **Load Balancing:** Application Load Balancer (ALB).
- **Database:** Amazon RDS (MySQL).
- **Security:** Security Groups (following the principle of least privilege), IAM Roles.

## 🚀 Deployment Steps
1. **Network Setup:** Configured a custom VPC with 6 subnets across two Availability Zones.
2. **Security:** Implemented layered Security Groups to restrict traffic flow between tiers.
3. **Data Layer:** Provisioned a Multi-AZ RDS instance.
4. **App Layer:** Configured EC2 instances with Apache, PHP, and WordPress; created an AMI for scaling.
5. **Scaling & HA:** Integrated an ALB and ASG to handle traffic spikes and provide self-healing capabilities.

## 📈 Key Learnings
- Designing for High Availability using Multiple AZs.
- Securing workloads by placing them in private subnets.
- Understanding the cost-to-performance ratio of AWS services.
