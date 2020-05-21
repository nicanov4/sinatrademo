require 'sinatra'
require 'sinatra/json'
require 'pg'
require 'active_record'
require 'sinatra/activerecord'


get'/' do
  erb :index
end

get'/cake/:id' do |id|
  erb :cake, :locals => {:id => id}
end
                                                           
get'/cake/:id/json' do |id|
  #con = PG.connect :dbname => 'cakedb', :user => 'nico',
  #                 :password => 'password'
  con = PG.connect(ENV['DATABASE_URL'])
  sql = "SELECT name FROM cakes WHERE id=#{id}"
  result = con.exec(sql)
  json result[0]
end

get'/cakes.json' do
  #con = PG.connect :dbname => 'cakedb', :user => 'nico',
  #                 :password => 'password'
  #con = PG.connect(ENV['DATABASE_URL'])
  sql = "SELECT * FROM cakes"
  result = con.exec(sql)
  cakes = Array.new
  result.each do |row|
    cakes.push(row)
  end
  json :cakes => cakes
end

post'/cake/:id/delete' do
  id = params[:id]
  #con = PG.connect :dbname => 'cakedb', :user => 'nico',
  #                 :password => 'password'
  con = PG.connect(ENV['DATABASE_URL'])
  sql = "DELETE FROM cakes WHERE id=#{id}"
  con.exec(sql)
  redirect'.'
end

post'/cake/:id/edit' do
  id = params[:id]
  new_cake_name = params[:name]
  #con = PG.connect :dbname => 'cakedb', :user => 'nico',
  #                 :password => 'password'
  con = PG.connect(ENV['DATABASE_URL'])
  sql = "UPDATE cakes SET name = '#{new_cake_name}' WHERE id  = #{id}"
  con.exec(sql)
  redirect back
end
