# README

[![Build Status](https://travis-ci.org/howtohireme/juniorjobs.ru.svg?branch=master)](https://travis-ci.org/howtohireme/juniorjobs.ru)

[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/howtohireme/juniorjobs.ru/maintainability)

* Ruby version 2.5.0
# Step 0
The list of what should be already installed:
* [github](https://git-scm.com/downloads)
* [ruby 2.5.0](https://www.ruby-lang.org/ru/downloads/)
* [rails 5](http://rubyonrails.org/)
* [postgreSQL](https://www.postgresql.org/download/)

1. Clone the project
```
git clone git@github.com:howtohireme/juniorjobs.ru.git
```
2. Run setup
```
bin/setup
```

3. ENVIRONMENT VARIABLES:
=> Gibbon & Mailchimp:
* MAILCHIMP_LIST_ID
* ACCESS_KEY_ID
=> Github
* GITHUB_CLIENT_ID
* GITHUB_SECRET
* CALLBACK_DOMAIN
=> Redis
* REDIS_HOST
