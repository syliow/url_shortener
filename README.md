# URL Shortener

This is a URL shortening service built with Ruby on Rails.

**Deployed Application URL**: [urlshortener-shanyi.up.railway.app](https://urlshortener-shanyi.up.railway.app)

## Table of Contents

- [Installation](#installation)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Tests](#running-the-tests)
- [Using Docker Compose](#using-docker-compose)
- [Screenshots](#screenshots)
- [Continuous Deployment with Railway](#continuous-deployment-with-railway)

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

4. **Create a `secrets.sh` file** in the root directory and add the following environment variables:

    ```sh
    export POSTGRES_DB=your_database_name
    export POSTGRES_USER=your_database_user
    export POSTGRES_PASSWORD=your_database_password
    export DATABASE_URL=postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@db:5432/$POSTGRES_DB
    export IPINFO_API_TOKEN=your_ipinfo_api_token
    export SECRET_KEY_BASE=your_secret_key_base
    ```

5. **Source the `secrets.sh` file** to set the environment variables:

    ```sh
    source secrets.sh
    ```

6. **Start the Rails server:**

    ```sh
    rails server
    ```

7. **Visit the application:**

    Open your browser and go to `http://localhost:3000`.

## Dependencies

This project relies on several dependencies, which are managed via the `Gemfile`. Key dependencies include:

- **Rails**
- **PostgreSQL**
- **Tailwindcss-Rails**
- **IPinfo** (for geolocation)

For a complete list, see the [Gemfile](Gemfile).

## Configuration

Configuration settings can be found in the `config` directory
Ensure you set the `SECRET_KEY_BASE` environment variable in your `.env` file or through your deployment platform.

## Environment Variables

Create a `secrets.sh` file under the root directory and add the following credentials:

```sh
export POSTGRES_DB=your_database_name
export POSTGRES_USER=your_database_user
export POSTGRES_PASSWORD=your_database_password
export DATABASE_URL=postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@db:5432/$POSTGRES_DB
export IPINFO_API_TOKEN=your_ipinfo_api_token
export SECRET_KEY_BASE=your_secret_key_base
```

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


## Continuous Deployment with Railway
This project uses [Railway](https://railway.app/) to handle Continuous Deployment (CD).
