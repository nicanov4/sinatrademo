require 'sinatra'
require 'sinatra/json'
require 'pg'

get'/' do
  erb :index
end

get'/cake/:id' do |id|
  erb :cake, :locals => {:id => id}
end
                                                           
get'/cake/:id/json' do |id|
  con = PG.connect :dbname => 'cakedb', :user => 'nico',
                   :password => 'password'
  sql = "SELECT name FROM cakes WHERE id=#{id}"
  result = con.exec(sql)
  json result[0]
end

get'/cakes.json' do
  con = PG.connect :dbname => 'cakedb', :user => 'nico',
                   :password => 'password'
  sql = "SELECT * FROM cakes"
  result = con.exec(sql)
  cakes = Array.new
  result.each do |row|
    cakes.push(row)
  end
  json :cakes => cakes
end
