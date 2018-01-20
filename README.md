# README

[![Build Status](https://travis-ci.org/howtohireme/juniorjobs.ru.svg?branch=master)](https://travis-ci.org/howtohireme/juniorjobs.ru)

[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/codeclimate/codeclimate/maintainability)

* Ruby version 2.5.0

### Step 1
1. clone the project in your terminal type:
```
git clone git@github.com:howtohireme/juniorjobs.ru.git
```
2. Run bundler
```
bundle install
```
3. Run tests
```
rails test
```
If you stumble upon Runtime Error message:
```
Cannot load `Rails.application.database_configuration`:
Could not load database configuration. No such file - ["config/database.yml"] (RuntimeError)
```
Linux: `mv config/database.yml.sample database.yml`
Windows: `rename config/database.yml.sample database.yml`

