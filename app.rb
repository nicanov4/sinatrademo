require 'sinatra'



get'/' do
  @cakes = File.open("cake.list", "r")
  erb :index
end
