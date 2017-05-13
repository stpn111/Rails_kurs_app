class Exhibit < ActiveRecord::Base
  belongs_to :collection
  validates :name, :sdescription, presence: true
  validates :name, :sdescription, length: {maximum:100}
  validates :name, uniqueness: {scope: [:name]}
  validates :insurance, :century, :height, :width, :length, numericality: {only_integer: true, allow_nil: false}
end
