require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'
StandaloneMigrations::Tasks.load_tasks
configurator = StandaloneMigrations::Configurator.new
ENV['SCHEMA'] = configurator.schema
