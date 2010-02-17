class Shirt < ActiveRecord::Base
  #associations 
  belongs_to :user
  belongs_to :gender
  belongs_to :size

  Shirt.paginate :page => 1, :order => 'created_at DESC'
  
  #paperclip plugin by thoughbot for front of shirt
  has_attached_file :front, :styles => {:thumb => ["240x224#", :png]}
  
  validates_presence_of :description, :gender, :size
  validates_attachment_presence :front
  validates_attachment_content_type :front,
      :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  def self.find_by_genders(gender_list)
    Shirt.find(:all, :include => :gender, :conditions => {"genders.name" => gender_list})
  end
  
  def self.find_by_sizes(size_list)
    Shirt.find(:all, :include => :size, :conditions => {"sizes.name" => size_list})
  end
  
  def self.per_page
    6
  end
end
