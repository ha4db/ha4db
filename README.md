# Ha4db

## System requirement

- Ruby 2.7
- PostgreSQL
- PostGIS
- NodeJS + yarn

## Configration for development

```sh
bundle
yarn
export HA4DB_DEVELOPMENT_DATABASE_URL=postgres://myuser:mypass@localhost/ha4db_development
rails db:create RAILS_ENV=development
rails db:migrate RAILS_ENV=development
```

## Running test suite

```sh
export HA4DB_TEST_DATABASE_URL=postgres://myuser:mypass@localhost/ha4db_test
rails db:create RAILS_ENV=test
rails db:migrate RAILS_ENV=test
bin/rspec
```

## Lint

```sh
bin/rubocop
yarn eslint . --ext .js,.jsx,.ts,.tsx
```

## Deployment instructions

...