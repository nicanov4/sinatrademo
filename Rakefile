require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'
configurator = StandaloneMigrations::Configurator.new
ENV['SCHEMA'] = configurator.schema
