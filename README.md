# 2048-Game
2048 is static Front End Application powered by HTML (Markup language), CSS (Styling), Java Script (Dynamic behaviour).

# AIM
Deploy the 2048-game in AWS cloud with DevSecOps best practices. Refer the architecture.md file in docs folder for more details.


# Folder Structure

```
.github/      → Contains CI/CD workflows and GitHub Actions automation.

docs/         → Stores project documentation, architecture diagrams, and troubleshooting guides.

docker/       → Holds Docker-related files and custom container configurations.

monitoring/   → Includes Prometheus, Grafana, and monitoring stack configurations.

scripts/      → Contains automation scripts for deployment, cleanup, and maintenance tasks.

src/          → Holds the main application source code and static assets.

terraform/    → Contains Infrastructure as Code files for AWS/cloud resource provisioning.

.dockerignore → Specifies files and folders excluded from Docker build context.

.gitignore    → Defines files and folders ignored by Git version control.

README.md     → Main project documentation, setup instructions, and project overview.

```
### CI/CD flow
### Tools used
```
1.AWS - Cloud Platform
2.Github Actions - CI/CD Pielines
3.Docker - Containerizing the application
4.ECR - Store the Docker Images
5.Prometheus - Application Metrics
6.Grfana - UI Dashboard for prometheus
7.CloudWatch - Application logs
8.Terraform - Infrastructure as Code
```
### Screenshots
### Monitoring screenshots
### ArgoCD screenshots
### Scaling screenshots
### Security scans
### Cost optimization notes
### Disaster recovery approach
### Deployment steps
### Challenges faced
### Future improvements

# DOCKER
Analyze the docker/Dockerfile. I have implemented the following 8 best practices to create a docker file.

1.USE OFFICIAL DOCKER IAMGE AS BASE IMAGE

	-> FROM ubuntu => FROM node
	
2. USE SPECIFIC IMAGE VERSIONS => FROM node:17.0.1

3.USE SMALL SIZED OFFICIAL IMAGES

	-> COUID BE BASED ON FULL-BLOWN OS --BAD PRACTICE
	-> USE IMAGE BASED ON A LEANER AND SMALLER OS DISTRO --BEST PRACTICE
	-> FROM node:17.0.1 => FROM node:17.0.1-alpine
	-> alpine will have all the things that you can start with alpine.
	
4.OPTIMIZE CACHING IMAGE LAYERS
	
	-> IMAGE LAYERS -> EACH COMMAND CREATES AN IMAGE LAYER
	-> EACH LAYER GET CACHED BY DOCKER AND SAVED ON LOCAL SYSTEM.
	-> IF NOTHING HAS CHANGED IN LAYER OR ANY LAYERS PRECEEDING IT IT WILL BE REUSED FROM CACHE.
	-> ONCE A LAYER CHANGES, ALL FOLLOWING LAYERS ARE RECREATED AS WELL. CACHE GET INVALIDATED.
	
	
	ORDER DOCKERFILE COMMANDS FROM LEAST TO MOPST FREQUENTLY CHANGING.

5.EXCLUDE THE FILES
    -> USE .dcokerignore file to ignore the unwanted files.
    -> LIST ALL UNWANTED THINGS.
    -> DURING BUILD DOCKER LOOKS INTO IT AND IGNORES THOSE FILES

6.MAKE USE OF MULTI-STAGE-BUILDS

    -> Contents that you NEED for building the image , dont need them in the final image to run the app.
    -> Test dependencies, deveopement tools, Build tools
    -> EX: PACKAGE.JSON, PACKAGE-LOCK.JSON AREN'T NEED FOR FINAL IMAGE.
    (Here, it's just a static application and there are test files and build tools. So, here no need)
	
7.WHICH OS USER will be used to start the application?

    -> By default docker runs on Root user which is security bad practrice bad pracice

    -> USE THE LEAST PRIVILEGED USER

```dockerfile
	CRETAE A DEICATED USER AND GROUP.
	
	#CREATE GROUP AND USER
	RUN groupadd -r tom && useradd -g tom tom
	
	#set ownership and permissions
	RUN chown -R  tom:tom /app
	
	#Switch to user
	USER tom
	
	CMD node index.js
```
	
some base images have generic user => node:10-alpine



8.HOW TO VALIDATE THE BUILT IMAGE FOR SECURITY VULNERABILITIES?

    -> SCAN YOUR IMAGE FOR SECURITY VULNERABILITIES.
    -> docker build -t <name>:<version>
    -> Open docker hub, click on the image
    -> On Right side, click on start analysis
    -> Analyze vulnabiloities ( I will make the vulnerabilities zero - You are already on wrong thinking)

--------------------------------------------------------------------------
	
	