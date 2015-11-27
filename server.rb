require 'sinatra'
require 'sinatra/reloader'
require_relative('lib/sinatra_blog/Blog.rb')

nikos_blog = Blog.new()
nikos_blog.add_post("How to build a Blog", "Hola0", "Nikos", "Test")
nikos_blog.add_post("How to build a Dog", "Hola1", "Nikos", "Test")

get "/" do
	@posts = nikos_blog.show_posts
	@blog_name = nikos_blog.blog_name
	erb :show_posts, layout: :sinatra_layout
end

get "/posts/:post" do
	@blog_name = nikos_blog.blog_name
	@posts = nikos_blog.show_posts
	post_id = params[:post].to_i
	@post = @posts[post_id]
	erb :show_post_details, layout: :sinatra_layout
end

get "/add_post" do
	@blog_name = nikos_blog.blog_name
	erb :add_post, layout: :sinatra_layout
end

post "/send_post" do
	nikos_blog.add_post(params[:post_title], params[:post_text])
	redirect ("/")
end
