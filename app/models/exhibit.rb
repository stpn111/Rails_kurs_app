class Exhibit < ActiveRecord::Base
  belongs_to :collection
  validates :name, :sdescription, presence: true
  validates :name, :sdescription, length: {maximum:100}
  validates :name, uniqueness: {scope: [:name]}
  validates :insurance, :century, :height, :width, :length, numericality: {only_integer: true, allow_nil: false}
  
  def self.search(params)
     result = Exhibit.includes(:collection => :showrooms).references(:collection => :showrooms)
     if params['name'].present?
       result = result.where(name: params['name'])
     end
     if params['sdescription'].present?
       result = result.where(sdescription: params['sdescription'])
     end
     if params['insurance'].present?
       result = result.where(insurance: params['insurance'])
     end
     if params['century'].present?
       result = result.where(century: params['century'])
     end
     if params['height'].present?
       result = result.where(height: params['height'])
     end
     if params['width'].present?
       result = result.where(width: params['width'])
     end
     if params['length'].present?
       result = result.where(height: params['length'])
     end   
     if params['tempcontrol'].present?
       result = result.where(tempcontrol: params['tempcontrol'])
     end  
     if params['himiditycontrol'].present?
       result = result.where(himiditycontrol: params['himiditycontrol'])
     end                     
     if params['colname'].present?
       result = result.where(collections: {colname: params['colname']})
     end
     if params['shdescription'].present?
       result = result.where(collections: {shdescription: params['shdescription']})
     end
     if params['begindate'].present?
       result = result.where(collections: {begindate: params['begindate']})
     end
     if params['enddate'].present?
       result = result.where(collections: {enddate: params['enddate']})
     end
     if params['roomname'].present?
       result = result.where(showrooms: {roomname: params['roomname']})
     end

result.all
end
end
