# 1--containerize-a-node.js-web-application
1- containerize a node.js web application

# 🐳 Task 1: Containerize a Node.js Web Application

> **Enterprise DevOps Scenario:** Containerize a Node.js Express application using Docker to ensure consistent deployment across development, testing, and production environments.

![Docker](https://img.shields.io/badge/Docker-Container-blue)
![Node.js](https://img.shields.io/badge/Node.js-Express-green)
![License](https://img.shields.io/badge/License-MIT-orange)

---

# 📖 Project Overview

Containerization has become the standard method for packaging and deploying modern applications. This project demonstrates how to containerize a simple **Node.js Express** web application using **Docker**.

The application is packaged into a Docker image, allowing it to run consistently on any system that supports Docker without requiring Node.js or additional dependencies to be installed on the host.

---

# 🎯 Objective

* Build a simple Node.js Express application.
* Create a Docker image.
* Run the application inside a Docker container.
* Expose the application on port **3000**.
* Verify the application from a web browser.
* Push the Docker image to Docker Hub.

---

# 🧩 Real-World Scenario

Your development team has created a Node.js web application. Instead of asking every developer or server administrator to install Node.js manually, you package the application into a Docker image.

This approach ensures:

* Consistent environments
* Easy deployment
* Simplified dependency management
* Faster onboarding
* Improved scalability

---

# 📂 Project Structure

```text
docker-nodejs-webapp/
│
├── app.js
├── package.json
├── package-lock.json
├── Dockerfile
├── .dockerignore
├── README.md
└── screenshots/
    ├── build.png
    ├── running-container.png
    └── browser-output.png
```

---

# ⚙️ Prerequisites

Before starting, ensure the following are installed:

* Docker Desktop (Windows/macOS)
* Docker Engine (Linux)
* Node.js 22 or later (optional for local development)
* Git

---

# 🚀 Application Code

## app.js

```javascript
const express = require("express");

const app = express();

const PORT = 3000;

app.get("/", (req, res) => {
    res.send("🚀 Docker Container is Running Successfully!");
});

app.listen(PORT, () => {
    console.log(`Application running on port ${PORT}`);
});
```

---

## package.json

```json
{
  "name": "docker-nodejs-webapp",
  "version": "1.0.0",
  "description": "Simple Express application running inside Docker",
  "main": "app.js",
  "scripts": {
    "start": "node app.js"
  },
  "dependencies": {
    "express": "^4.21.2"
  }
}
```

Install dependencies:

```bash
npm install
```

---

# 🐳 Dockerfile

```dockerfile
FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

---

# 🚫 .dockerignore

```text
node_modules
.git
.gitignore
README.md
npm-debug.log
```

---

# 🔨 Build Docker Image

```bash
docker build -t docker-nodejs-webapp:v1 .
```

Verify the image:

```bash
docker images
```

---

# ▶️ Run the Container

```bash
docker run -d \
--name node-webapp \
-p 3000:3000 \
docker-nodejs-webapp:v1
```

Verify the running container:

```bash
docker ps
```

---

# 🌐 Access the Application

Open your browser:

```
http://localhost:3000
```

Expected output:

```
🚀 Docker Container is Running Successfully!
```

---

# 📋 View Container Logs

```bash
docker logs node-webapp
```

Expected output:

```
Application running on port 3000
```

---

# 🛑 Stop and Remove the Container

Stop the container:

```bash
docker stop node-webapp
```

Remove the container:

```bash
docker rm node-webapp
```

---

# 🗑️ Remove the Docker Image

```bash
docker rmi docker-nodejs-webapp:v1
```

---

# ☁️ Push to Docker Hub

Login:

```bash
docker login
```

Tag the image:

```bash
docker tag docker-nodejs-webapp:v1 <dockerhub-username>/docker-nodejs-webapp:v1
```

Push the image:

```bash
docker push <dockerhub-username>/docker-nodejs-webapp:v1
```

Pull the image on another machine:

```bash
docker pull <dockerhub-username>/docker-nodejs-webapp:v1
```

Run the image:

```bash
docker run -d -p 3000:3000 <dockerhub-username>/docker-nodejs-webapp:v1
```

---

# 📸 Screenshots

Add the following screenshots to the `screenshots/` directory:

| Screenshot            | Description                            |
| --------------------- | -------------------------------------- |
| build.png             | Docker image build output              |
| running-container.png | Running Docker container (`docker ps`) |
| browser-output.png    | Browser displaying the application     |

Example:

```text
screenshots/
├── build.png
├── running-container.png
└── browser-output.png
```

---

# 📚 Docker Commands Used

| Command                                                                 | Description                    |
| ----------------------------------------------------------------------- | ------------------------------ |
| `docker build -t docker-nodejs-webapp:v1 .`                             | Build the Docker image         |
| `docker images`                                                         | List Docker images             |
| `docker run -d -p 3000:3000 --name node-webapp docker-nodejs-webapp:v1` | Run the container              |
| `docker ps`                                                             | List running containers        |
| `docker logs node-webapp`                                               | View container logs            |
| `docker stop node-webapp`                                               | Stop the container             |
| `docker rm node-webapp`                                                 | Remove the container           |
| `docker rmi docker-nodejs-webapp:v1`                                    | Remove the Docker image        |
| `docker login`                                                          | Authenticate with Docker Hub   |
| `docker tag`                                                            | Tag the image                  |
| `docker push`                                                           | Push the image to Docker Hub   |
| `docker pull`                                                           | Pull the image from Docker Hub |

---

# 🎓 Learning Outcomes

After completing this project, you will be able to:

* Understand Docker fundamentals.
* Create a Dockerfile for a Node.js application.
* Build Docker images.
* Run applications in containers.
* Map host ports to container ports.
* Manage Docker container lifecycle.
* Publish images to Docker Hub.
* Follow containerization best practices.

---

# 🔮 Future Improvements

* Multi-stage Docker builds
* Non-root container execution
* Health checks
* Docker Compose support
* Environment variable configuration
* Reverse proxy with Nginx
* CI/CD using GitHub Actions or Jenkins
* Vulnerability scanning with Trivy

---

# 👨‍💻 Author

**Sudheesh K**

Senior Infrastructure Lead | DevOps & Cloud Engineer

---

# ⭐ Support

If you found this project helpful:

* ⭐ Star this repository
* 🍴 Fork the project
* 📢 Share it with others
* 💡 Contribute improvements through pull requests

Happy Containerizing! 🐳

