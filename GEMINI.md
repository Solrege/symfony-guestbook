# Guestbook Project Overview

This project is a Guestbook application built with **Symfony 6.4**. It allows users to browse conferences and post comments.

## Tech Stack
- **Framework**: Symfony 6.4
- **Language**: PHP 8.1+
- **Database**: PostgreSQL 15
- **Web Server**: Nginx
- **Spam Filtering**: Akismet API
- **Admin Interface**: EasyAdminBundle
- **Containerization**: Docker & Docker Compose

## Project Structure
- `/guestbook`: The main Symfony application.
- `Dockerfile`, `docker-compose.yml`, `nginx.conf`: Infrastructure and environment setup.
- `guestbook/src/Entity`: Database entities (Conference, Comment, Admin).
- `guestbook/src/Controller`: Main application controllers and admin controllers.
- `guestbook/src/SpamChecker.php`: Core logic for spam detection.
- `guestbook/migrations`: Doctrine database migrations.
- `guestbook/templates`: Twig templates for the frontend.
- `guestbook/tests`: PHPUnit tests.

## Building and Running

### Environment Setup
1. **Build the containers**:
   ```bash
   docker-compose build
   ```
2. **Start the environment**:
   ```bash
   docker-compose up -d
   ```
   The application should be accessible at `http://localhost:8080`.

### Database Management
- **Run migrations**:
  ```bash
  docker-compose exec php bin/console doctrine:migrations:migrate
  ```
- **Create a new migration**:
  ```bash
  docker-compose exec php bin/console make:migration
  ```

### Testing
- **Run all tests**:
  ```bash
  docker-compose exec php bin/phpunit
  ```
- **Load fixtures for tests**:
  ```bash
  docker-compose exec php bin/console doctrine:fixtures:load --env=test --no-interaction
  ```

### Administrative Interface
Accessible at `/admin` (requires login). Admin entities are managed via `DashboardController`.

## Development Conventions
- **Migrations**: Always use Doctrine Migrations for database schema changes.
- **Spam Checking**: Comments are automatically checked via the `SpamChecker` service.
- **Testing**: Follow existing patterns in `tests/` for creating new test cases. Functional tests using `WebTestCase` are preferred for controllers.
- **Coding Style**: Adhere to PSR-12 and standard Symfony practices.
