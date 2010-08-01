require 'rubygems'
require 'compass'
require 'coderay'
require 'sinatra'
require 'syntax/convertors/html'
require 'haml'
require 'grit'
include Grit

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, "views"
set :public, "static"

configure do 
    Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.config'))
end

before do
    repo_path = "/Users/gmichaelcramm/rails/repos/quick-grit"
    @repo_name = repo_path.split("/").last
    @repo = Repo.new(repo_path)
end

get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end

get '/' do
    @last_commit = @repo.commits.first
    haml :index
end

get "/commits" do
    @commits = @repo.commits
    haml :commits
end

get '/commit/:id' do |id|
    @commit = @repo.commits(id).first
    haml :commit
end

get '/blob/:id' do |id|
    @blob = @repo.blob(id)
    haml :blob
end

def highlight(type, content)
    CodeRay.scan(content, 'diff').div(:css => :class)
end

private
