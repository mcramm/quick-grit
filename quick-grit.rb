require 'rubygems'
require 'sinatra'
require 'erb'
require 'grit'
include Grit



get '/' do
  @repo = Repo.new("/Users/gmichaelcramm/rails/repos/quick-grit")
  @commits = @repo.commits
  erb :index
end

get '/ticket/:id' do |id|
  "Viewing Ticket #{id}"  # doesnt do anything yet!
end


private
