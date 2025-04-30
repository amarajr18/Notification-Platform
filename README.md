# Notification-Platform

# 🛎️ Notification Platform (AWS Lambda + Terraform)

This is a serverless notification platform built using **AWS** services and **Terraform** for infrastructure as code. It supports multi-channel delivery (Email, SMS, Push Notifications) through an API-driven architecture.

---

## 📌 Project Overview

The platform enables applications or services to send notifications to end users via Email, SMS, and Push. It is built entirely with AWS-managed services, making it scalable, secure, and cost-efficient.

All infrastructure is provisioned using **Terraform**, allowing for clean, reusable, and version-controlled deployments.

---

## 🧰 Technologies Used

- **AWS Lambda** – Core notification handler
- **Amazon API Gateway** – REST API endpoint for clients
- **Amazon SNS** – For Email and SMS delivery
- **Amazon Pinpoint** / **Firebase** – For Push Notifications
- **Amazon DynamoDB** – For logging and traceability
- **AWS CloudWatch** – For monitoring and alerting
- **Amazon S3** (optional) – For backup log storage
- **AWS KMS** – For encryption at rest
- **Terraform** – Infrastructure as Code
- **Node.js** – Lambda runtime

---

## 🗂️ Architecture Diagram

![Architecture](architecture/final_notification_architecture.png)

---

## 🚀 How to Deploy with Terraform

1. Navigate to the Terraform directory:

    ```bash
    cd terraform
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Review the execution plan:

    ```bash
    terraform plan
    ```

4. Apply the configuration:

    ```bash
    terraform apply
    ```

5. Deploy the Lambda function:

    ```bash
    cd ../lambda
    ./zip.sh
    aws lambda update-function-code --function-name notificationHandler --zip-file fileb://notification.zip
    ```

---

## 🧠 Lambda Code Explanation

The Lambda function is responsible for:

- Parsing the incoming request payload
- Identifying the notification `type` (email, sms, or push)
- Routing the request to the appropriate channel
- Logging the event to DynamoDB
- Returning a response to the client

```javascript
const body = JSON.parse(event.body);
const type = body.type;

switch (type) {
  case "email":
    // Email handling logic
    break;
  case "sms":
    // SMS handling logic
    break;
  case "push":
    // Push notification logic
    break;
}
