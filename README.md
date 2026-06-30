# Student Data | Premium Student Management System

A sleek, responsive, and completely self-contained **Student Management System** built with a pure **Java** backend and an **HTML/CSS/JS** frontend.

This project is designed with **zero external dependencies**—no Maven, Gradle, Spring Boot, or external databases are required. It compiles and runs out-of-the-box using the standard JDK.

---

## Key Features

- **Responsive SPA Dashboard**: A gorgeous glassmorphism UI featuring smooth animations, modern typography (Outfit & Inter), and a layout that adapts to desktops, tablets, and phones.
- **Dark / Light Theme Toggle**: A sliding toggle to switch themes with preferences persisted in local storage.
- **Real-Time Analytics**:
  - Live counts for total enrollments, average class grade (with numeric GPA conversion), average age, and top course.
  - Interactive custom CSS bar chart displaying the distribution of grades.
  - Honor roll sidebar listing top performing students.
- **Advanced Registry Directory**:
  - Grid and List layouts with a live view-mode switcher.
  - Dynamic course filtering (courses are extracted from actual records).
  - Multi-parameter sorting (Name A-Z/Z-A, Age Youngest/Oldest, Roll Number).
  - Live query searching across name, roll number, and email.
- **RESTful Java API**: Built using Java's native `com.sun.net.httpserver.HttpServer` with multithreading capabilities.
- **Auto-Persistence**: Real-time write-through updates stored in a local `students.json` database.
- **Seeded Mock Data**: Seeds 5 initial records on the first startup so you can interact with the dashboard immediately.

---

## Project Structure

```
Student Management System/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── student/
│       │           ├── App.java            # Server startup & Request router
│       │           ├── Student.java        # Student Entity Model
│       │           ├── StudentService.java # Storage, CRUD & JSON persistence
│       │           └── JsonUtils.java      # Custom JSON serialization/parsing
│       │
│       └── resources/
│           └── web/
│               ├── index.html              # Frontend template structure
│               ├── style.css               # Elegant dashboard styling (Light/Dark)
│               └── app.js                  # Frontend controllers & AJAX calls
│
├── run.bat                                 # One-click Windows launch launcher
└── README.md                               # Project documentation
```

---

## How to Run

### Windows (Quick Start)
1. Ensure a Java Development Kit (JDK 8 or higher) is installed on your computer.
2. Double-click the `run.bat` file in the root folder.
3. Open your browser and navigate to: **[http://localhost:8080](http://localhost:8080)**

### macOS & Linux / Manual Terminal Run
1. Open a terminal and navigate to the project directory.
2. Compile the Java files:
   ```bash
   mkdir bin
   javac -d bin src/main/java/com/student/*.java
   ```
3. Run the compiled application:
   ```bash
   java -cp bin com.student.App
   ```
4. Open your browser and navigate to: **[http://localhost:8080](http://localhost:8080)**

---

## API Documentation

All requests use JSON payload bodies with header `"Content-Type: application/json"`.

| Endpoint | Method | Parameter | Description |
| :--- | :--- | :--- | :--- |
| `/api/students` | `GET` | *None* | Get list of all enrolled students. |
| `/api/students` | `GET` | `id=<uuid>` | Get a single student by unique ID. |
| `/api/students` | `POST` | *None* | Create a new student (payload required). |
| `/api/students` | `PUT` | `id=<uuid>` | Update details of an existing student (payload required). |
| `/api/students` | `DELETE` | `id=<uuid>` | Remove a student record. |
