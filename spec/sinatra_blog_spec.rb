require 'spec_helper'
require_relative("../lib/sinatra_blog/Blog.rb")


describe SinatraBlog do
  it 'has a version number' do
    expect(SinatraBlog::VERSION).not_to be nil
  end
end
describe "BlogTest" do
  describe "shows Blog's post" do
    it "It shows as many post as has been created" do
      blog1 = Blog.new()
      blog1.add_post("How to build a Blog", DateTime.now, "Hola0", false)
      blog1.add_post("How to build a Dog", DateTime.now, "Hola1", false)
      array_posts = blog1.container
      expect(array_posts.count).to eq(2)
    end
  end
end
