# URL Shortener

This is a URL shortening service built with Ruby on Rails.

## Table of Contents

- [Installation](#installation)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Test](#running-the-test)
- [Services](#services)
- [Deployment](#deployment)

## Installation

Follow these steps to get the application up and running on your local machine.

1. **Clone the repository:**

    ```sh
    git clone https://github.com/syliow/url_shortener.git
    cd url_shortener
    ```

2. **Install the required gems:**

    ```sh
    bundle install
    ```

3. **Set up the database:**

    ```sh
    rails db:create
    rails db:migrate
    ```

4. **Start the Rails server:**

    ```sh
    rails server
    ```

5. **Visit the application:**

    Open your browser and go to `http://localhost:3000`.

## Dependencies

This project relies on several dependencies, which are managed via the `Gemfile`. Key dependencies include:

- **Rails**
- **PostgreSQL**
- **Tailwindcss-Rails**

For a complete list, see the [Gemfile](Gemfile).

## Configuration

Configuration settings can be found in the `config` directory. Key files include:

- `config/application.rb`
- `config/environments/development.rb`
- `config/environments/test.rb`
- `config/environments/production.rb`

Ensure you set the `SECRET_KEY_BASE` environment variable in your `.env` file or through your deployment platform.

## Database Setup

1. **Create the database:**

    ```sh
    rails db:create
    ```

2. **Run migrations:**

    ```sh
    rails db:migrate
    ```
## Running the Test 

To run the test , use the following command:

```sh
rails test
```

This will execute all tests in the test directory

## Using Docker Compose
1. Build and run the Docker containers:

```sh
docker-compose up -d
```

2. **Visit the application:**

Open your browser and go to `http://localhost:3000`.

## Screenshots
Homepage
![image](https://github.com/user-attachments/assets/3f1166de-0da4-40e2-9fc7-0d6ed4dc350a)

Shorten URL
![image](https://github.com/user-attachments/assets/702d3674-75a2-4d4d-8f4f-7b61850bc569)

Report Page: Total URL Clicks 
![image](https://github.com/user-attachments/assets/fcd1d987-2a3e-4075-aefb-d831362533d8)

Report Page: User Click logs
![image](https://github.com/user-attachments/assets/4fce7445-6ad4-4af1-b0ac-3dd81021b5a2)



