# GCP Resources Automation

This repository contains Terraform configurations and modules to automate the provisioning of Google Cloud Platform (GCP) resources, including virtual machines (VMs), networks (VPC and subnets), and storage buckets. It's designed for learning, development, or production environments where infrastructure as code (IaC) is needed.
# Prerequisites
- **Terraform**: Version 1.0+ installed (download from [terraform.io](https://www.terraform.io/downloads.html)).
- **GCP Account**: Active project with billing enabled.
- **GCP Authentication**: Set up Application Default Credentials (ADC) via `gcloud auth application-default login` or use a service account key file exported as `GOOGLE_APPLICATION_CREDENTIALS=/path/to/key.json`.
- **Required APIs**: Enable Compute Engine, Cloud Storage, and any other relevant APIs in your GCP project.
- **Git**: To clone this repo.

# Contributing
1. Fork the repo.
2. Create a feature branch: `git checkout -b feature/new-module`.
3. Commit changes: `git commit -m "Add new feature"`.
4. Push: `git push origin feature/new-module`.
5. Open a Pull Request.

For questions, open an issue!
