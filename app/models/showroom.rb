class Showroom < ActiveRecord::Base
	has_and_belongs_to_many :collections, :dependent => :destroy
	validates :roomname, presence: true, uniqueness: {scope: [:roomname]}	
end
