# CI/CD Pipeline for Web Application Deployment

This repository contains a GitHub Actions workflow configured for the automated deployment, integration testing, and rollback of a simple React web application using Google Cloud Platform (GCP). The pipeline leverages Docker, Google Container Registry (GCR), and Google Kubernetes Engine (GKE) to manage the deployment process effectively.

## Project Structure

The project includes the following key components:

- **Dockerfile**: Defines the multi-stage build process and sets up Nginx as the reverse proxy.
- **nginx.conf**: Configuration file for Nginx.
- **.github/workflows/deploy.yml**: GitHub Actions workflow file for CI/CD.
- **src/**: Source code for the React application.

## Setup Instructions

### Prerequisites

Before setting up the pipeline, ensure you have the following:

- **Google Cloud Account**: Access to GCR and GKE.
- **GitHub Repository**: Fork or clone this repository to your GitHub account.
- **Docker**: Installed on your local machine.
- **kubectl**: For interacting with GKE.
- **gcloud CLI**: Installed and configured for Google Cloud SDK.

### Configuration

1. **Set Up Google Cloud Credentials**:
   - Create a service account in GCP with the necessary permissions for GCR and GKE.
   - Generate a JSON key file and add it as a GitHub secret named `GCP_SA_KEY`.

2. **Configure GitHub Secrets**:
   - Add the following secrets to your GitHub repository:
     - `GCP_PROJECT_ID`: Your Google Cloud project ID.
     - `GKE_CLUSTER_NAME`: The name of your GKE cluster.
     - `GKE_CLUSTER_ZONE`: The zone where your GKE cluster is located.

3. **Nginx Configuration**:
   - Modify `nginx.conf` if you have specific configurations for your application.

## Building and Running Locally

To build and run the Docker image locally, follow these steps:

```bash
# Build the Docker image
docker build -t my-react-app .

# Run the Docker container
docker run -p 8081:80 my-react-app

Visit http://localhost:8081 to view the application running locally.

## GitHub Actions Workflow

The `.github/workflows/deploy.yml` file defines the CI/CD pipeline with the following steps:

1. **Checkout Code**: Pulls the latest code from the GitHub repository.
2. **Build Docker Image**: Uses a multi-stage Docker build process to create an optimized image with Nginx.
3. **Push Image to GCR**: Pushes the built image to Google Container Registry.
4. **Deploy on GKE**: Deploys the Docker image to Google Kubernetes Engine.
5. **Integration Tests**: Runs integration tests to verify the deployment.
6. **Rollback**: Rolls back to the previous version if the deployment fails.

### Integration Tests

The pipeline includes integration tests to ensure the deployment is functioning correctly. If any tests fail, the workflow will automatically roll back to the previous stable version.

## License

This project is licensed under the MIT License. 

## Contact

For any questions or issues, please contact Shubham Jha (Innovator07).

