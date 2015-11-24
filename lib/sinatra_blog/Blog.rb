require 'date'

class Blog
	attr_accessor :container
	def initialize ()
		@container = []
	end	

	def save_post(post)
		@container << post
	end

	def create_front_page
		@container.sort do |post1, post2|
			# puts post1.date
			# puts post2.date
			post2.date <=> post1.date
		end
	end

	def populate_page
		
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
attr_accessor :title, :text
attr_reader :date, :type
	def initialize ( title, date, text, type = false)
		@title = title
		@date = date
		@text = text
		@type = type
	end	
end	





