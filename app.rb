require 'sinatra'
require 'sinatra/json'
require 'active_record'
require 'sinatra/activerecord'
require 'pg'

class Cake < ActiveRecord::Base
end

#local database
configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'cakedb', pool: 2, username: 'nico', password: 'password'}
end

configure :production do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'cakedb', pool: 2, username: 'nico', password: 'password'}
end

get'/DataReset' do
  Cake.delete_all()
  @cakes = File.open('cake.list', 'r')
  @cakes.each_line do |line|
    Cake.create(name: line)
  end
end

get'/' do
  erb :index
end

get'/cake/:id' do |id|
  erb :cake, :locals => {:id => id}
end
                                                           
get'/cake/:id/json' do |id|
  cake = Cake.find_by(id: id)
  json cake
end

get'/cakes.json' do
  result = Cake.all
  cakes = Array.new
  result.each do |row|
    cakes.push(row)
  end
  json :cakes => cakes
end

post'/cake/:id/delete' do
  id = params[:id]
  Cake.destroy(id)
  redirect'.'
end

post'/cake/:id/edit' do
  id = params[:id]
  new_cake_name = params[:name]
  cake = Cake.find_by(id: id)
  cake.update(name: new_cake_name)
  redirect back
end
