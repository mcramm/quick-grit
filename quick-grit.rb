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


def highlight(type, content)
  converter = Syntax::Convertors::HTML.for_syntax type
  @out = converter.convert(content)
end

private
