require 'date'

class Blog
  attr_accessor :container, :blog_name
  def initialize (blog_name = "Nikos' blog!")
    @container = []
    @blog_name = blog_name
  end
  def add_post(title,text, author, cat,date = DateTime.now, type = false)
    save_post(Post.new(title, text, author, cat,date, type))
  end
  def save_post(post)
    @container << post
    latest_post()
  end
  def latest_post
  	@container.sort do |post1, post2|
      post2.date <=> post1.date
    end
  end
  # def create_front_page
  #   @container.sort do |post1, post2|
  #     post2.date <=> post1.date
  #   end
  # end

  # def populate_page

  # end
  def show_posts
  	@container
  end
  def publish_front_page
    if (@container.size == 0)
      puts " There are no posts here yet. It´s time to post something new!!"
    else
      @container.each do |post|
        # post.type == false ? {puts  "*****#{post.title}****": puts "*****#{post.title.upcase}****"}
        if(post.type == true)
          puts "*****#{post.title.upcase}****"
        else
          "*****#{post.title}****"
        end
        puts "**************"
        puts post.date
        puts post.text
        puts "--------------"
      end
    end
  end
end


class Post
  attr_accessor :title, :text, :author, :cat
  attr_reader :date, :type
  def initialize (title,text, author, cat, date = DateTime.now, type = false)
    @title = title
    @date = date
    @text = text
    @type = type
    @author = author
    @cat = cat
  end
end
