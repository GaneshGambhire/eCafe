### eCafe Web Application

An interactive eCafe application built with Spring Boot, Thymeleaf, and MySQL. This application offers seamless management of café operations while delivering a user-friendly interface.


## About the Project
eCafe is a web-based café management system designed to simplify order management, menu updates, and customer interactions. It provides an efficient and scalable solution for managing café operations.



## Key Features
- Manage menu items (add, update, delete).
- Place and track customer orders.
- User authentication and role-based access.
- View order history and sales analytics.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Java Development Kit (JDK) installed
- Apache Maven installed
- MySQL Server installed and running
- MySQL Workbench (optional) for database management

## Getting Started

To get a local copy up and running follow these simple steps.

### Installation

1. Clone the repository:

```sh
git clone https://github.com/GaneshGambhire/eCafe.git
```

2. Navigate into the project directory:

```sh
cd eCafe
```

### Configuration

1. Open the `application.properties` file located in `src/main/resources` directory.
2. Update the MySQL database connection details according to your local setup:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/your_database_name
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### Build and Run

1. Build the project using Maven:

```sh
mvn clean install
```

2. Run the application:

```sh
mvn spring-boot:run
```

3. Once the application is running, access it through your web browser at [http://localhost:8080].

### Usage

- Navigate through the application and interact with its features.
- Use the MySQL Workbench or any other MySQL client to manage the database as needed.

