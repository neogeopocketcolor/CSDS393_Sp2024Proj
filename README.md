# CSDS393_Sp2024Proj
Dinner Table, web based application

## Enviornment requirement
- Node 16.17.0
- Mysql 8.0.11
- Springboot
- JDK 1.8

## Features
- User friendly interface
- User based application with profile creation
- Recipe related functions

## Acknoledgements
We've built this project by standing on the shoulders of giants, leveraging open-source projects and templates that have set industry standards for excellence. We extend our sincerest gratitude and acknowledge the use of the following resources:

- **Vue Element Admin**: Our project's frontend template and many components are inspired by or directly referenced from [Vue Element Admin](https://panjiachen.github.io/vue-element-admin-site/), created by Pan JiaChen. This incredible resource has been instrumental in shaping the visual and functional architecture of our application, allowing us to focus on innovation while maintaining high-quality standards. We highly recommend visiting their [official website](https://panjiachen.github.io/vue-element-admin-site/) and [GitHub repository](https://github.com/PanJiaChen/vue-element-admin) to explore the full capabilities of Vue Element Admin.

## Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

This project requires Node.js to be installed on your machine. To check if you have Node.js installed and verify its version, run the following command in your terminal:

```bash
npm -v
```


This project has been tested with Node version 16. If you do not have Node.js installed, please visit [Node.js's official website](https://nodejs.org/) for installation instructions.

### Installation

1. **Clone the Repository:**

   First, clone the repository to your local machine using Git. Open your terminal, navigate to the directory where you want to clone the repository, and run:

```
git clone https://github.com/neogeopocketcolor/CSDS393_Sp2024Proj
```
2. **Set Up the Database:**

   Before starting the application, ensure your SQL server is up and running. Run the SQL statements found in `user.sql` to set up the database schema and initial data required by the application.

3. **Start the Backend:**

   Ensure the backend server is running. Follow the backend setup documentation (not provided here) to get it started.

4. **Run the Frontend Application:**

   Navigate to the root directory and start the development server by running:

```bash
cd menu-vue
npm run dev
```

5. **Access the Application:**

   Once the frontend development server is up, open your web browser and visit [https://localhost:8088](https://localhost:8088) to start the demo of the application.
