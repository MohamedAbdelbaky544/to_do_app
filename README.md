
# to_do_app


## Overview
This Flutter project, named To_do_app Assignment, is a mobile application designed to manage tasks by delete ,add and update tasks by using no sql database (hive). you can change task state to complated or incomplated 

## Features

- **Listing tasks**: View a list of created tasks  with essential details about it like title and description.
- **Edit tasks**: can edit task and save it to database .
- **Add tasks**: you can add new tasks to you database.
- **Delete Tasks**: you can delete tasks from the listed tasks.

## Screenshots
![Screenshot_1736274845](https://github.com/user-attachments/assets/6510486b-a1ee-4785-b801-8b5aed168850)
![Screenshot_1736276800](https://github.com/user-attachments/assets/d27887de-30c0-4f20-a903-23129df62ba9)
![Screenshot_1736274880](https://github.com/user-attachments/assets/c31f418a-57c2-441f-b8a5-17577c729e8c)

# to_do_app

## Architecture

The HotelsGo Assignment project follows a clean and modular architecture, separating concerns to enhance maintainability and scalability. The architecture is inspired by the Flutter BLoC (Business Logic Component) pattern.

### Architecture Components

1. **Presentation Layer (UI):**
   - Widgets: Responsible for rendering the user interface.
   - Screens: Represent individual screens of the application.
   - controller(state management): Manage the presentation logic.

2. **Domian Layer (contract)**
   - Entitys: models of the data without serialization to the data.
   - BaseRepositories: it will be abstract class to be as contract between data and domain .
   - usecase: it only node which is connect to Presentation Layer.


3. **Data Layer:**
   - dataSource: Communicate with external APIs or databases.
   - Models: inherit from Entitys and make factory to serialized  the data return from API.
   - Repositories: implemantion to BaseRepositories to handle request from data source.

### Architecture Flow

![clean_Arch](https://github.com/user-attachments/assets/b9ce5d54-dc3a-4112-bbed-187362be3374)


*Clean Architecture With Flutter *


## Getting Started

Follow these steps to run the project locally:

1. Clone the repository:

   ```bash
   git clone https://github.com/MohamedAbdelbaky544/to_do_app.git

2. Navigate to the Project Directory:
  
   ```bash
   cd to_do_app

3. Install Dependencies:
  
   ```bash
   flutter pub get

4. Run the App:

   ```bash
   flutter run
