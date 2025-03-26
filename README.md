Here's an improved version of your `README.md` with better clarity, formatting, and enhanced structure:

---

# Linux Bash Reference

Welcome to the **Linux Bash Reference** project. This repository is a guide to learning Linux terminal commands and Bash scripting basics, based on the freeCodeCamp tutorial [Command Line for Beginners](https://www.freecodecamp.org/news/command-line-for-beginners/#heading-difference-between-console-command-line-cli-terminal-and-shell). It focuses on practical skills and foundational knowledge for efficient system management.

## Key Skills and Topics

- **Essential Linux Commands**: Mastering commands for file and directory management.
- **Bash Scripting**: Writing and debugging scripts using variables, loops, and conditionals.
- **Task Automation**: Boosting productivity by automating common tasks in Linux environments.

## Repository Highlights

- **Hands-On Examples**: Real-world demonstrations of command-line tools and scripting, which can be found in my [SAP HANA Linux Repo](https://github.com/JThomas404/SAP-HANA-Professional-Portfolio).
- **Structured Learning Path**: Covers foundational knowledge, scripting techniques, and advanced tips for optimisation.

## Purpose of This Project

This beginner project showcases my ability to learn and apply technical concepts, troubleshoot effectively, and adapt to Linux-based systems. It highlights my journey from understanding basic commands to automating complex tasks via scripting.

## Script: `newghrepo.sh`

The `newghrepo.sh` script automates the process of creating a new GitHub repository and pushing local files to it. By combining Git initialization, GitHub API integration, and remote configuration into one script, it simplifies the repository setup process.

### Features:
- Creates a `README.md` file with the repository name.
- Initializes a local Git repository and commits the initial changes.
- Uses the GitHub API to create a new repository on GitHub.
- Configures the remote repository and pushes local files to GitHub.

### Usage:

1. **Set your GitHub username and personal access token in the script**:
    ```bash
    GITHUB_USER="YourGitHubUsername"
    GITHUB_TOKEN="YourPersonalAccessToken"
    ```

2. **Run the script** with your desired repository name:
    ```bash
    ./newghrepo.sh my-new-repo
    ```

   This will create a new repository on GitHub, initialize a local Git repository, commit the necessary files, and push them to GitHub.

---

### Basic Linux Bash Commands

Here are some basic Linux Bash commands that every beginner should know:

- **`pwd`**: Print the current working directory.
- **`ls`**: List the files and directories in the current directory.
- **`cd <directory>`**: Change the current directory.
- **`mkdir <directory>`**: Create a new directory.
- **`touch <filename>`**: Create a new empty file.
- **`rm <file>`**: Remove a file.
- **`cp <source> <destination>`**: Copy a file or directory.
- **`mv <source> <destination>`**: Move or rename a file or directory.
- **`cat <filename>`**: Display the contents of a file.
- **`echo <text>`**: Print text to the terminal.
- **`chmod <permissions> <file>`**: Change file permissions.
- **`man <command>`**: Display the manual page for a command.

---