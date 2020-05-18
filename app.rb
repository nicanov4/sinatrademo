require 'sinatra'

cakes = Array.new
file = File.open("cake.list", "r")
file.each_line do |line|
  cakes.push(line)
end

get '/' do
  cakes
end
