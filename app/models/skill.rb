class Skill < ApplicationRecord
=begin
    here has direct connection to database
=end 
validates_presence_of :title, :percent_utilized
end
