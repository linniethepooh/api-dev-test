## Driftrock's Developer Test

# Task

Create a script that can be run from the command line and can answer the questions listed below. The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output.

# User Stories
```
As a user,
I can see the most sold item for all purchases,
I want to be able to run a command through the terminal.

As a user,
I can see the total spent for a specific user email,
I want to be able to run a command through the terminal.

As a user,
I can see the most loyal user,
I want to be able to run a command through the terminal.
```

# How to install

Navigate into the folder:
```
$ cd driftrock-dev-test
```

Install all the gems running
```
$ bundle install
```

# How to test

To run the app enter the following in the command line:
```
ruby app.rb COMMAND PARAMETERS
```
Here are the available commands:

most_sold: What was the name of the most sold item? e.g
```
ruby app.rb most_sold
```
total_spend [EMAIL]: What is the total spend of the user with this email address [EMAIL]? e.g.
```
ruby app.rb drift.rock@email.com
```
most_loyal: What is the email address of the most loyal user (most purchases)? e.g.
```
ruby app.rb most_loyal
```

# How to test

To test functionality run the command line:
```
$ rspec
```
To test style run the command line:
```
$ rubocop
```

# Tech

- Ruby (https://www.ruby-lang.org/en/)
- Rspec (http://rspec.info/)
- RuboCop (https://rubocop.readthedocs.io/en/latest/)


