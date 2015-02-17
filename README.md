# capistrano-twitter

Capistrano recipe to send a message to twitter

## Installation

	gem install capistrano-twitter

## Usage

Include the recipe

	require 'capistrano-twitter'

Set required parameters

	set :twitter_consumer_key, "consumer key"
	set :twitter_consumer_secret, "consumer secret"
	set :twitter_access_token, "access token"
	set :twitter_access_token_secret, "access token secret"
	set :twitter_message, "MyApplication version {branch} has been deployed."

Add the task, e.g on after

	after "twitter:notify"
