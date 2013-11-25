class Pin < ActiveRecord::Base
  
  # associations
  belongs_to :user
  has_attached_file :image, :styles => { :large => "515x572>", :medium => "200x200>", :small => "150x150>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"


  
  # validations
  validates_presence_of :description, :user_id
  validates_attachment :image, presence: true,
                              content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif' ] },
                              size: { less_than: 3.megabytes } 
end
