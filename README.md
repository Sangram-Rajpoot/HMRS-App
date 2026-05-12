# HRMS (Human Resource Management System)

## Available Languages

[🇬🇧 English](#english)

---

# English

## Project Description

HRMS (Human Resource Management System) is a Spring Boot-based web service application designed to manage job postings, job applications, employer information, and candidate information.

The project follows REST API architecture and includes modern software development practices such as **DTO**, **Request-Response Pattern**, **Validation**, and **Global Exception Handling**. 

---

## Features

* **City Management**: Add and list cities.
* **Job Position Management**: Add and list job positions.
* **Employer Management**: Register and list employers.
* **Candidate Management**: Register and list job seekers.
* **Job Advertisement Management**: Add, list, and filter job advertisements.
* **Job Application Management**: Allow candidates to apply for job advertisements.
* **Error Handling**: Global exception handling using `@ControllerAdvice`.
* **Validation**: Field validation using annotations such as `@NotBlank` and `@Size`.

---

## Technologies Used

* **Java 17**
* **Spring Boot**
* **Spring Data JPA (Hibernate)**
* **PostgreSQL**
* **Lombok**
* **Validation API (Jakarta Validation)**
* **Jackson**
* **Postman** for API testing

---

## Project Layers

* **Entity**: Represents database tables.
* **DTO**: Data Transfer Objects used for API responses.
* **Request**: Classes used for incoming API requests.
* **Service**: Business logic layer.
* **Repository (DAO)**: Database access layer.
* **Controller**: REST API endpoint layer.
* **Core Utilities**: Common response structures such as `Result`, `DataResult`, `SuccessResult`, and `ErrorResult`.

### Result Structure

* `Result`: Returns operation success/failure status and message.
* `DataResult<T>`: Returns operation status along with data.
* `SuccessResult` / `ErrorResult`: Ready-made classes for successful or failed operations.

---

## Sample API Endpoints

| HTTP Method | Endpoint                        | Description                     |
| ----------- | ------------------------------- | ------------------------------- |
| POST        | `/api/employers/register`       | Register a new employer         |
| GET         | `/api/employers/getAll`         | Retrieve all employers          |
| POST        | `/api/candidates/register`      | Register a new candidate        |
| GET         | `/api/candidates/getAll`        | Retrieve all candidates         |
| POST        | `/api/jobAdvertisements/add`    | Add a new job advertisement     |
| GET         | `/api/jobAdvertisements/getAll` | Retrieve all job advertisements |
| POST        | `/api/jobApplications/apply`    | Apply for a job advertisement   |

---

## Sample JSON Requests

### Employer Registration

```json
{
  "companyName": "Tech Solutions Ltd.",
  "companyWebPage": "https://techsolutions.com",
  "email": "contact@techsolutions.com",
  "phoneNumber": "+1-555-123-4567",
  "password": "password123",
  "confirmPassword": "password123"
}
```

### Candidate Registration

```json
{
  "name": "Aysu",
  "lastName": "Ay",
  "nationalId": "12345678901",
  "birthDate": 2000,
  "email": "aysu@example.com",
  "password": "password123",
  "confirmPassword": "password123"
}
```
