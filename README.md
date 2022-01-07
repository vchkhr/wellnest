# [mobidev-rubyInternship-mhc](https://mental.vchkhr.com/)

Platform where coaches help users to deal with anxiety and depression.

## Installation

### 1. Clone the Repository and setup Environment

1. Select the last `challenge-x` branch.
2. Clone the repository and open the their folder in the Terminal.
3. Fill in the `.env` file. Create it using the `.env.template`.\
Use `DATABASE_HOST=localhost` to use without Docker,\
or `DATABASE_HOST=database` to use with Docker.

### 2a. Use without Docker
1. Run `rails db:setup`.
2. Run `npm install`.
3. Run `rails webpacker:compile; rails s`.

### 2b. Use with Docker
1. Run `docker-compose up -d`
2. Run `docker-compose exec app bundle exec rake db:setup db:migrate`

### 3. Open the Application
1. Open the `http://localhost:3000` page in the browser.\
You will see the application's front page.
