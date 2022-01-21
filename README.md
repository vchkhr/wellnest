# [mobidev-rubyInternship-mhc](http://mental.vchkhr.com/)

Platform where coaches help users to deal with anxiety and depression.

## Installation

### 1. Clone the Repository and setup Environment

1. Select the last `challenge-x` branch.
2. Clone the repository and open their folder in the Terminal.
3. Fill in the `.env` file. Create it using the `.env.example`.\
Use `DATABASE_HOST=localhost` to use without Docker, or\
`DATABASE_HOST=database` to use with Docker.

### 2a. Use without Docker
1. Run `rails db:setup` in the console.
2. Run `npm install`.
3. Run `rails webpacker:compile; rails s`.

### 2b. Use with Docker
1. Run `docker-compose up -d` in the console.
2. Run `docker-compose exec app bundle exec rake db:setup db:migrate`.

### 3. Open the Application
1. Open the `http://localhost:3000` page in the browser.\
You will see the application's front page.

## Usage

### Open the Application

#### 1a. Use without Docker
1. Run `rails webpacker:compile; rails s` in the console.

#### 1b. Use with Docker
1. Run `docker-compose up -d; docker-compose exec app bundle exec rails console` in the console.

#### 2. Open the Application
1. Open the `http://localhost:3000` page in the browser.\
You will see the application's front page.

### Shut down the Application

#### 1a. Use without Docker
1. Press `cmd+C` in the console.

#### 1b. Use with Docker
1. Type `exit` into the console.
2. Run `docker-compose down`.

### Open the Admin Panel
1. After opening the Application, go to `http://localhost:3000/admin` page in the browser.
2. Type `admin@example.com` into the email field, and `password` into the password field.\
Press `Enter` and now you can use the ActiveAdmin Panel.
