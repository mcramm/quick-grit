require 'rubygems'
require 'sinatra'
require 'erb'
require 'grit'

repo = Repo.new("/Users/gmichaelcramm/rails/repos/quick-grit")

get '/' do
  erb :index
end

get '/ticket/:id' do |id|
  "Viewing Ticket #{id}"  # doesnt do anything yet!
end


private
