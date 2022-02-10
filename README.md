# Rails Engine Lite: Turing 2110 BE Mod 3

![languages](https://img.shields.io/github/languages/top/sethperna/rails-engine-lite?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/sethperna/rails-engine-lite)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Background and Description

"Rails Engine Lite" is a individual project that requires students to build API endpoints to expose data for merchants and items, as well to search for merchants and items using those endpoints. The project also features GitHub API statistics that will update as contributors add commits, and pull requests to the project.
- Original Project and Requirements can be found [here](https://github.com/turingschool-examples/rails-engine-lite).

## Learning Goals
- Practice building API endpoints to expose limited data.
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice serializing to protect and format data in a conventional format.

## Schema
- See image below for project database schema:
<img width="1010" alt="Screen Shot 2022-02-10 at 11 56 33 AM" src="https://user-images.githubusercontent.com/90224504/153457206-8c74f40f-20a8-4d89-8c97-0f7446a0393a.png">

## Requirements and Setup (for Mac):

### Ruby and Rails
- Ruby Version 2.7.4
- Rails Version 5.2.6

### Gems Utilized
- RSpec 
- Pry
- SimpleCov
- Capybara
- Shoulda-Matchers v5.0
- Factory_Bot_Rails
- Faker
- jsonapi-serializer

## Setup
1. Clone this repository:
On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the repositiory.


- using ssh key <br>
```shell
$ git clone git@github.com:sethperna/rails-engine-lite.git
```

- using https <br>
```shell
$ git clone https://github.com/sethperna/rails-engine-lite.git
```

Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Change to the project directory:<br>
In terminal, use `$cd` to navigate to the Little Esty Shop project directory.

```shell
$ cd rails-engine-lite
```

3. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

There should be be verbose text diplayed of the installation process that looks similar to below. (this is not an actual copy of what will be output).

```shell
$ bundle install
Using rake 13.0.6
Using concurrent-ruby 1.1.9
Using i18n 1.9.1
Using minitest 5.15.0
Using thread_safe 0.3.6
Using tzinfo 1.2.9
Using activesupport 5.2.6
Using builder 3.2.4
Using erubi 1.10.0
Using mini_portile2 2.7.1
Using racc 1.6.0
Using nokogiri 1.13.1
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.13.0
Using rails-html-sanitizer 1.4.2
Using actionview 5.2.6
Using rack 2.2.3
Using rack-test 1.1.0
Using actionpack 5.2.6
Using nio4r 2.5.8
Using websocket-extensions 0.1.5
Using websocket-driver 0.7.5
Using actioncable 5.2.6
Using globalid 1.0.0
Using activejob 5.2.6
Using mini_mime 1.1.2
Using mail 2.7.1
Using actionmailer 5.2.6
Using activemodel 5.2.6
Using arel 9.0.0
Using activerecord 5.2.6
Using marcel 1.0.2
Using activestorage 5.2.6
Using msgpack 1.4.4
Using bootsnap 1.10.3
Using bundler 2.1.4
Using byebug 11.1.3
Using coderay 1.1.3
Using diff-lcs 1.5.0
Using docile 1.4.0
Using factory_bot 6.2.0
Using method_source 1.0.0
Using thor 1.2.1
Using railties 5.2.6
Using factory_bot_rails 6.2.0
Using faker 2.19.0
Using ffi 1.15.5
Using jsonapi-serializer 2.2.0
Using rb-fsevent 0.11.1
Using rb-inotify 0.10.1
Using ruby_dep 1.5.0
Using listen 3.1.5
Using pg 1.3.1
Using pry 0.14.1
Using puma 3.12.6
Using sprockets 4.0.2
Using sprockets-rails 3.4.2
Using rails 5.2.6
Using rspec-support 3.10.3
Using rspec-core 3.10.2
Using rspec-expectations 3.10.2
Using rspec-mocks 3.10.3
Using rspec-rails 5.1.0
Using shoulda-matchers 5.1.0
Using simplecov-html 0.12.3
Using simplecov_json_formatter 0.1.3
Using simplecov 0.21.2
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
Bundle complete! 16 Gemfile dependencies, 70 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```
If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

4. Database Migration<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db: {:drop, :create, :migrate, :seed}
```

5. Pg Dump Load
Next we will seed environment with generic data by using CSV files by running the following command

```shell
$ rails db:schema:dump
```

6. Startup and Access<br>
Finally, in order to use the web app you will have to start the server locally and access the app through a web browser. 
- Start server
```shell
$ rails s
```

- Open web browser and visit link
    http://localhost:3000/
    
At this point you should be taken to the welcome page of the web-app. If you encounter any errors or have not reached the web-app please confirm you followed the steps above and that your environment is properly set up.

## Heroku Deployment
- The deployment to Heroku can be found [here](https://little-esty-shop-2110.herokuapp.com/)

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)

## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/sethperna"><img src="https://avatars.githubusercontent.com/u/88012780?v=4" width="100px;" alt=""/><br /><sub><b>Seth (he/him)</b></sub></a><br /><a href="https://github.com/tjroeder/little-esty-shop/commits?author=arnaldoaparicio" title="Code">💻</a> <a href="#ideas-arnaldoaparicio" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/tjroeder/little-esty-shop/commits?author=arnaldoaparicio" title="Tests">⚠️</a> <a href="https://github.com/tjroeder/little-esty-shop/pulls?q=is%3Apr+reviewed-by%3Ajarnaldoaparicio" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/echon006"><img src="https://avatars.githubusercontent.com/u/89038271?v=4" width="100px;" alt=""/><br /><sub><b>Eric (he/him)</b></sub></a><br /><a href="https://github.com/tjroeder/little-esty-shop/commits?author=echon006" title="Code">💻</a> <a href="#ideas-echon006" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/tjroeder/little-esty-shop/commits?author=echon006" title="Tests">⚠️</a> <a href="https://github.com/tjroeder/little-esty-shop/pulls?q=is%3Apr+reviewed-by%3Ajechon006" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/tjroeder"><img src="https://avatars.githubusercontent.com/u/78194232?v=4" width="100px;" alt=""/><br /><sub><b>Tim (he/him)</b></sub></a><br /><a href="https://github.com/tjroeder/little-esty-shop/commits?author=tjroeder" title="Code">💻</a> <a href="#ideas-tjroeder" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/tjroeder/little-esty-shop/commits?author=tjroeder" title="Tests">⚠️</a> <a href="https://github.com/tjroeder/little-esty-shop/pulls?q=is%3Apr+reviewed-by%3Atjroeder" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/wadenaughton"><img src="https://avatars.githubusercontent.com/u/90228086?v=4" width="100px;" alt=""/><br /><sub><b>Wade (he/him)</b></sub></a><br /><a href="https://github.com/tjroeder/little-esty-shop/commits?author=wadenaughton" title="Code">💻</a> <a href="#ideas-wadenaughton" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/tjroeder/little-esty-shop/commits?author=wadenaughton" title="Tests">⚠️</a> <a href="https://github.com/tjroeder/little-esty-shop/pulls?q=is%3Apr+reviewed-by%3Ajwadenaughton" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--

