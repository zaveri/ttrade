class AddGenders < ActiveRecord::Migration
  def self.up
    genders = %w[
      Male
      Female
  ]
  genders.each do |gender|
    Gender.new(:name => gender).save!
  end
  
  end

  def self.down
  end
end
