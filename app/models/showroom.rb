class Showroom < ActiveRecord::Base
	has_and_belongs_to_many :collections
	validates :roomname, presence: true, uniqueness: {scope: [:roomname]}	
end
