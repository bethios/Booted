# Booted 
## A wiki for coding bootcamp students and grads

Booted is a Ruby on Rails application that allows recent bootcamp grads to supplement skills missing from their bootcamp education, 
brush up on interview techniques and share advice.  Users can upgrade to premium membership which will allow them to 
create private wikis and collaborate with other users. This feature is designed so a bootcamp cohort graduating together
can communicate, share resources on their particular struggles and keep in touch after the bootcamp has ended. 

This app is deployed on Heroku: https://booted-resource.herokuapp.com/

The source code is available, here, on github: https://github.com/bethios/Booted

## Features
- Users can sign up for an account (via the Devise gem), receive a confirmation email, retrieve and change their passwords.
- Users can view, edit and create public wikis using markdown syntax (via the RedCarpet gem). 
- Users can upgrade to premium membership (via the Stripe gem). 
- Premium members can create an unlimited number of private wikis.
- Premium members can add collaborators, both standard and premium users, to a wiki. 
- Premium members can downgrade their account to standard. 


## Setup and Configuration
** Ruby v. 2.3.3 **
** Rails v. 4.2.8 **
** Databases:** SQLite (Test, Development), PostgreSQL (Production)

** Gems Used: ** 
- Devise, User Authentication
- Faker, Seed Database
- Factory Girl, Development
- Bootstrap, styling
- Bcrypt, data encryption
- Figaro, environmental variables
- Devise, User management
- Pundit, authorization
- Stripe, payment processing
- RedCarpet, Markdown syntax
- Friend ID, Human URLs

** Set-up: **
- Environmental variables were secured using Figaro and are stored in config/application.yml (ignored by github)
- The config/application.example.yml illustrates the formatting for environmental variables.

** To run Booted locally: **
- Clone the repository
- Run bundle install
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Start the server using rails s
- Run the app on localhost:3000
