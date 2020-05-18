require 'sinatra'
require 'sinatra/json'

get'/' do
  erb :index
end

get'/cakes.json' do
  @cakes = File.open("cake.list", "r")
  @cakes_array = Array.new
  @cakes.each_line do |line|
    @cakes_array.push(line.split"\n")
  end
  json :cakes => @cakes_array
end
