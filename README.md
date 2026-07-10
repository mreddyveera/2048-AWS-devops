### 2048-Game

2048 is static Front End Application powered by HTML (Markup language), CSS (Styling), Java Script (Dynamic behaviour).

### AIM

Deploy the 2048-game in AWS cloud with DevSecOps best practices. Refer the architecture.md file in docs folder for more details.

### Folder Structure

```
.github/      → Contains CI/CD workflows and GitHub Actions automation.

docker/       → Holds Docker-related files and custom container configurations.

scripts/      → Contains automation scripts for deployment, cleanup, and maintenance tasks.

src/          → Holds the main application source code and static assets.

terraform/    → Contains Infrastructure as Code files for AWS/cloud resource provisioning.

.dockerignore → Specifies files and folders excluded from Docker build context.

.gitignore    → Defines files and folders ignored by Git version control.

README.md     → Main project documentation, setup instructions, and project overview.

```
### Architecture Diagram

![Architecture Diagram](diagrams/2048-game-architecture-diagram.png)

### 🛠️ Technologies & Tools

```
| Category               | Technology     |
| ---------------------- | -------------- |
| Infrastructure as Code | Terraform      |
| Containerization       | Docker         |
| CI/CD                  | GitHub Actions |
| Scripting              | Python         |
| Version Control        | Git & GitHub   |
| Cloud Platform         | AWS            |

```

### ☁️ AWS Services Used

```
| Service                             | Purpose                                                                     |
| ----------------------------------- | --------------------------------------------------------------------------- |
| **Amazon VPC**                      | Isolated network for the application infrastructure                         |
| **Application Load Balancer (ALB)** | Distributes incoming traffic across ECS tasks                               |
| **Amazon ECS (Fargate)**            | Runs the containerized 2048 application without managing servers            |
| **Amazon ECR**                      | Private Docker image registry                                               |
| **Amazon Route 53**                 | DNS management and domain routing                                           |
| **AWS Certificate Manager (ACM)**   | Manages SSL/TLS certificates for HTTPS                                      |
| **Amazon CloudWatch**               | Centralized application logs, metrics, and monitoring                       |
| **Amazon SNS**                      | Sends email notifications for CloudWatch alarms                             |
| **IAM**                             | Provides secure access control for ECS tasks, Terraform, and GitHub Actions |
| **Security Groups**                 | Controls inbound and outbound network traffic                               |
| **Internet Gateway**                | Enables internet access for public resources                                |
| **NAT Gateway**                     | Allows private subnets to access the internet securely                      |
| **Elastic IP**                      | Provides static public IP addresses for NAT Gateways                        |

```
### Monitoring screenshots

### ArgoCD screenshots

### Scaling screenshots

### Security scans

### Cost optimization notes

### Disaster recovery approach

### Deployment steps

### Challenges faced

### Future improvements

---
