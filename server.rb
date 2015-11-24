require 'sinatra'
require 'sinatra/reloader'
require_relative('lib/sinatra_blog/Blog.rb')

blog1 = Blog.new()


get "/" do
	
end