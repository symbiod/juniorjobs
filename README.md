# JuniorJobs

[![Build Status](https://travis-ci.org/howtohireme/juniorjobs.svg?branch=master)](https://travis-ci.org/howtohireme/juniorjobs)
[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/howtohireme/juniorjobs/maintainability)

## Project purpose

The following repo is an example of the first project developed by junior developers within HowToHireMe Bootcamp initiative.
The main idea of the project is to build a simple jobs board, that allows junior developers to find a real job.

Take a look at our [docs](https://github.com/howtohireme/juniorjobs/tree/master/docs) for detailed information about the project.

![Developed under HowToHireMe mentorship](https://avatars2.githubusercontent.com/u/33529654?s=200&v=4)

## Contributing

Before open issue or PR, please check [contributing guide](CONTRIBUTING.md) for guidelines about how to proceed. Every contributor is expected to follow [code of conduct](CODE_OF_CONDUCT.md).

## Development

For setup development environment it requires:

* Ruby 2.5.5

In terminal:

```
  git clone https://github.com/symbiod/juniorjobs/
  cd juniorjobs
  
  bundle install
  
  rails s
```

### Setup with Vagrant

Vagrant unify development for different OS users.
Setup environment requires preinstalled:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

In terminal:

```
  git clone https://github.com/symbiod/juniorjobs/
  cd juniorjobs
  vagrant up
```

Now vagrant virtual machine is runing enter to it:

```
  vagrant ssh
```

Betterdocs is locate in `/app` on guest machine;

```
  cd /app
```

Run vagrant (It requires host option for proper port binding, and it can depend on OS):

```
  rails s --b 0.0.0.0
```
