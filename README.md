# Rails News Reader

* http://github.com/jpo/rails-news-reader

## DESCRIPTION:

Rails News Reader is a web application that allows a user to subscribe to a predefined list of RSS feeds. It was created as a protoype for a feature in another application which (hopefully) accounts for it's stunning lack of features.

## FEATURES:

* User accounts
* Subscribe to RSS feeds by category

Things it does not do (yet):

* Allow users to create custom categories
* Allow users to create custom feeds
* Allow users to mark feeds as read

## REQUIREMENTS:

Ruby, Rake, Bundler, and Rails 3.

## GETTING STARTED:

To get started quickly, you can just run it locally. Setting that up goes something like this:

* Open a terminal and navigate to the root directory of the application
* Run ```bundle install``` to install dependencies.
* Run ```rake db:migrate``` to create a local database.
* Run ```rake db:seed``` to install demo data.
* Run ```rails runner 'DownloadFeedsJob.run'``` to download RSS feeds.
* Run ```rails server``` to start a local web server.
* Open a browser and navigate to http://localhost:3000
