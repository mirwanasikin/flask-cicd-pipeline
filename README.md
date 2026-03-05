# Flask CI/CD Pipeline

End-to-end CI/CD pipeline for a containerized Flask application deployed to AWS EC2 using GitHub Actions.

## Architecture

Developer → GitHub → CI (pytest) → Docker Build → GHCR → Deploy → EC2 → Docker Container → Flask API

## Tech Stack

- Python (Flask)
- Docker
- GitHub Actions
- GitHub Container Registry (GHCR)
- Terraform
- Ansible
- AWS EC2

## Project Structure

```
.
├── .github/workflows
│   ├── test.yml
│   ├── build.yml
│   └── push_to_ec2.yml
├── src
│   └── app.py
├── tests
│   └── test_app.py
├── Dockerfile
└── README.md
```

## CI/CD Pipeline

1. Developer pushes code to GitHub
2. GitHub Actions runs tests using pytest
3. Docker image is built
4. Image pushed to GitHub Container Registry (GHCR)
5. Deployment workflow connects to AWS EC2 via SSH
6. EC2 pulls latest image and runs container

## Deployment

Application runs inside Docker container:

```
docker run -d \
--name flask_app \
-p 5000:5000 \
--restart always \
ghcr.io/<username>/flask-cicd-pipeline:latest

```

Health check endpoint:

```
curl localhost:5000/health

```

Response:

```
{"status":"healthy"}
```

## Infrastructure

Provisioned using Terraform

Resources:
- VPC Security Group
- EC2 Instance
- SSH Access

## License

MIT License
