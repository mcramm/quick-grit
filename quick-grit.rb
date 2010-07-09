require 'rubygems'
require 'sinatra'
require 'syntax/convertors/html'
require 'erb'
require 'grit'
include Grit

before do
  @repo = Repo.new("/Users/gmichaelcramm/rails/repos/quick-grit")
end

get '/' do
  @commits = @repo.commits
  erb :index
end

get '/commit/:id' do |id|
  @commit = @repo.commits(id).first
  erb :commit
end

get '/blob/:id' do |id|
  @blob = @repo.blob(id)
  erb :blob
end

def highlight(type, content)
    CodeRay.scan(content, 'diff').div(:css => :class)
end

private
