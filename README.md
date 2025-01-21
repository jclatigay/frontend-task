# Frontend-Task

A Ruby on Rails application that fetches and displays data from the Bored API (https://bored.api.lewagon.com/api/activity), allowing users to download the data in different formats.

## Live Demo

[Live Demo](https://mysite-b9ml.onrender.com/)
Note: The live demo is hosted on Render.com, so it may take a few seconds to load.

## Features

- Automatically fetches data 15 times from the Bored API
- Displays fetched data in a table format
- Download options:
  - Download as JSON file
  - Download as CSV file
  - Print to Console functionality

## Prerequisites

- Ruby version: 3.x
- Rails 7.x
- PostgreSQL

## Installation

1. Clone the repository:
```
git clone https://github.com/jclatigay/frontend-task.git
```

2. Navigate to the project directory:
```
cd frontend-task
```

3. Install dependencies:
```
bundle install
```

4. Database Setup
- Ensure PostgreSQL is running on your system
- create a .env file in the root directory
```
POSTGRES_USER=your_username
POSTGRES_PASSWORD=your_password
```
- Initialize the database:
```
rails db:create
rails db:migrate
```

5. Run the development server:
```
rails server
```

6. Visit http://localhost:3000 in your browser.

## Usage

When you open the application, it automatically fetches 15 random activities from the Bored API.
The data is displayed in a table format.

Use the buttons to:
- Download the data as a JSON file
- Download the data as a CSV file 
- Print the data to the browser console