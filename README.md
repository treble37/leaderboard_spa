##Documentation

###Project overview

This project is a leaderboard application.  It is a Rails 4.2 backed API (via Grape gem) with an AngularJS front end to handle the user-facing CRUD (create, read, update, delete) actions and client-side routing.

####Approach

Since I wanted to create as well-tested of an application as possible in a timely fashion, I used Ruby on Rails and RSpec to test and drive out the API and used RSpec to do some basic unit and validation testing.

I wanted to create a "single page" application type of user experience, and though mostly my experience has been writing server side rendered applications I decided to take a chance and use the Grape gem (which I've only used one other time) to help create a Rails-backed API with AngularJS on the front end to handle client-side routing and user interface actions.

On a side note, I also used the Yahoo Pure CSS framework as it is ~4.4 KB and has a light footprint, though for the purposes of this assignment, it doesn't matter from a technical standpoint.  But it was fun to experiment with another CSS framework.

####Models

Leaderboards can have many Users and Users belong_to Leaderboards.  For future work, I might like to convert the relationship to a has_many :through such that Leaderboards "have many users" through Game objects.  This would make it easier to assign users to multiple leaderboards.  

That's why you see a game.rb file in the code.

##Technical notes!

###Demo URL

Go to http://mysterious-refuge-1352.herokuapp.com and click on "Ping-Pong" to see the leaderboard for this game.

###Installation instructions

I used the RVM package manager and you'll notice the .ruby-gemset and .ruby-version files in this code repository.

Step 1: *bundle install* to your RVM gemset (or whatever setup is most convenient for you)

Step 2: *rake db:migrate* to setup the SQLite database locally and *rake db:seed* to get a set of sample data URls

Step 3: Do *rails s* at the command prompt and navigate to http://localhost:3000/

Step 4: Use the menu bar to navigate and follow the instructions on each page to create, lookup, or delete some URLs

###Requirements

This was created and tested on an Ubuntu 14.04 Linux system.  It should likely run on an OSx box without any trouble.

###Limitations

####Testing

More testing would help.  I'd like to add API tests and some basic integration tests.

####Error checking

I really don't do much in the way of error checking, other than validating that a user name is present before storing it in the database.
