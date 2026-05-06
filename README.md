## 🚀 About Me
I'm a junior DevOps engineer with some expertise in BackEnd development using Java and Node.js; scripting skills with Python, Bash and JavaScript; besides CI/CD and cloud knowledge of AWS and Azure DevOps tools ...

<p align="center">
<img src="https://c4.wallpaperflare.com/wallpaper/694/164/1000/digital-art-animals-eagle-bird-of-prey-birds-hd-wallpaper-preview.jpg" alt="Logo" width="400" height="230">
</p>

![linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![javascript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![nodejs](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)
![mysql](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white)
![aws](https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![azuredevops](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)

## 🔗 Portfolio
[![portfolio](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/RecursiveDeveloper)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jhoan-jesus-ortiz-sandoval-a66152198/)

# Express Server with Local and AWS Cloud Deployment

A Node.js Express server with local Docker deployment using Docker Compose and AWS cloud deployment capabilities. This project demonstrates containerized application development with a database backend, deployable both locally and on AWS infrastructure.

## Tech Stack 

- **Client:** ---
- **Server:** Node.js, Express
- **Database:** MySQL
- **Containerization:** Docker, Docker Compose
- **Cloud provider:** AWS (ECR and ECS underway)
- **Tools:** Docker, Docker Compose

## Installation

### Prerequisites

1. Install Docker according to your O.S [Install Docker](https://docs.docker.com/get-docker/)
2. Install Docker Compose according to your O.S [Install Docker Compose](https://docs.docker.com/compose/install/)

### Setup

1. Clone the repository
2. Navigate to the project directory
```bash
  cd simple_express_server-lab
```

## Local Deployment

To deploy this project locally using Docker Compose, follow these steps:

1) Navigate to the **local_deploy** folder
```bash
  cd local_deploy
```

2) Review the environment configuration
```bash
  cat .env.dev
```

3) Deploy the services using Docker Compose
```bash
  docker compose --env-file .env.dev up -d
```

This will start:
- **Database Service:** MySQL container with initialized database
- **Server Service:** Node.js Express application container

4) Access the application
- Server: `http://localhost:3000` (or configured port)
- Database: Available on configured port for local connections

### Stopping Services

To stop and remove the deployed services:
```bash
  docker compose --env-file .env.dev down -v --rmi all --volumes
```

For more information about Docker and Docker Compose commands check:
- [Docker Documentation](https://docs.docker.com/get-started/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

## AWS Cloud Deployment

AWS cloud deployment using ECR (Elastic Container Registry) and ECS (Elastic Container Service) is currently underway. This section will include detailed instructions for:

- Building and pushing Docker images to ECR
- Configuring ECS task definitions
- Deploying services on ECS
- Setting up load balancing and auto-scaling
- Database configuration on AWS RDS

Check back soon for complete AWS deployment documentation.

## Authors

- [@RecursiveDeveloper](https://github.com/RecursiveDeveloper)


## License

[MIT](https://choosealicense.com/licenses/mit/)