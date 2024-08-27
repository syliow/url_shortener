# URL Shortener

This is a URL shortening service built with Ruby on Rails.

## Table of Contents

- [Installation](#installation)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Test Suite](#running-the-test-suite)
- [Services](#services)
- [Deployment](#deployment)

## Installation

Follow these steps to get the application up and running on your local machine.

1. **Clone the repository:**

    ```sh
    git clone https://github.com/yourusername/url_shortener.git
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

- **Rails**: `~> 7.2.0`
- **PostgreSQL**: `~> 1.1`
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
bin/rails test
```

This will execute all tests in the test directory

