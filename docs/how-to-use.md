# How to use this archetype
The objective of this project is to provide a dockerized skeleton to be able 
to create Angular applications inside it in a simple way, being able to create 
Angular applications within it in a simple way, being able to have projects 
with different versions of Angular and Node with different versions of Angular 
and Node without the need to have them installed in our environment.

# Scaffolding
```
.
├── docs
│   └── how-to-use.md
├── .env.example
├── .gitignore
├── docker-compose.yml
├── Dockerfile
├── Makefile
└── README.md
```

# Steps

## 1. Download this repo in `.zip` format
It's important to download the repo in `.zip` format to avoid overwriting the archetype. When you run the make 
command to create the Angular app, a new git instance will be created.

## 2. Remove or rename the `README.md` and `.gitignore` files
This step is necessary to avoid errors when creating the Angular application. If you want to keep these
files, they can be renamed to avoid overwriting them.

## 3. Setting up environment variables
This project uses a `.env` file to manage environment-specific configurations. 
You can find an example configuration in the `.env.example` file.

### Steps to configure `.env` file
- **Copy the `.env.example` file to `.env`**
- **Edit the `.env` file**: Open the `.env` file and update the environment variables as needed.

## 4. Use the Makefile to create and manage the app
The Makefile provides a simple interface for common tasks such as building and running the application.
Some commands in the Makefile make use of variables defined in the `.env` file. Therefore, it is important 
to ensure that the `.env` file is correctly set up before running these commands.

To use it, open a terminal and specify the prefix `make` before the command to be executed.
These are some of the commands available:
- `build`: Builds the Docker image using the specified Angular and Node versions.
- `stop`: Stops the Docker containers.
- `ng-new`: Creates a new Angular application.

### Example usage
1. **Perform points 1 and 2**.
2. **Set Up Environment Variables:** Ensure your .env file is properly configured with the desired Angular and Node versions.
3. **Build the Docker image** with the Node and Angular CLI specified versions in the `.env`:
    ```bash
    make build
    ```
4. **Up the containers**:
    ```bash
    make up
    ```
5. **Create your Angular app** using the container Angular and Node versions.
    ```bash
    make ng-new
    ```
6. **Install extra dependencies**: If you're added new libraries to the project, use this command to update the dependencies 
   inside the container context.
    ```bash
    make npm-install
    ```
7. **Serve the Angular app**:
    ```bash
    make serve
    ```
8. **Open your browser** to see the Angular app. The URL will be the name of your app followed by `.localhost`. 
For example, if your app name is: `my-first-app`, the app url will be `my-first-app.localhost`.

9. **To stop the services**, just run:
    ```bash
    make stop
    ```
