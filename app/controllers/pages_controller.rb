class PagesController < ApplicationController
  def home
=begin
      The =begin and =end lines must be at the beginning of the line. They can't be indented.
      @posts is an instance variable
      you can call it blogs, posts, bla. doesn't really matter
      Blog.all is the blog model: blog,rb, which gives our connection to the database
      when called Blog.all, it gonna get all instances of BLog and store them in posts
=end
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end
