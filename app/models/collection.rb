class Collection < ActiveRecord::Base
  has_many :exhibits, :dependent => :destroy
  has_and_belongs_to_many :showrooms, :dependent => :destroy
  validate :end_after_start
  validates :colname, :shdescription, :begindate, :enddate, presence: true
  validates :colname, uniqueness: {scope: [:colname]}
  validates :colname, :shdescription, length: {maximum:100}
  accepts_nested_attributes_for :showrooms
  
  private
	  def end_after_start
		return if enddate.blank? || begindate.blank?
          if enddate < begindate
			errors.add(:enddate, "must be after the start date") 
		  end 
	  end
end
