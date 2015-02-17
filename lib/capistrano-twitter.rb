# encoding: utf-8
require 'capistrano'
require 'colored'
require 'twitter'

def _cset(name, *args, &block)
  unless exists?(name)
    set(name, *args, &block)
  end
end

Capistrano::Configuratio@n.instance.load do
  _cset(:twitter_consumer_key) { abort "Please specify twitter consumer key, set :twitter_consumer_key".red }
  _cset(:twitter_consumer_secret) { abort "Please specify twitter consumer secret, set :twitter_consumer_secret".red }
  _cset(:twitter_access_token) { abort "Please specify twitter access token, set :twitter_access_token".red }
  _cset(:twitter_access_token_secret) { abort "Please specify twitter access token secret, set :twitter_access_token_secret".red }
  _cset(:twitter_message) { abort "Please specify twitter notification message, set :twitter_message".red }

  namespace :twitter do
    desc "Send notification to twitter"
    task :notify, :except => { :no_release => true } do
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = twitter_consumer_key
        config.consumer_secret     = twitter_consumer_secret
        config.access_token        = twitter_access_token
        config.access_token_secret = twitter_access_token_secret
      end

      if Capistrano::CLI.ui.ask("Send notification to twitter? (y/N)") == 'y' then
        msg = twitter_message.gsub! '{branch}', branch
        client.update(msg)
      end
    end
  end
end
