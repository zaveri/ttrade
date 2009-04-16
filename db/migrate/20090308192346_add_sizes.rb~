class AddSizes < ActiveRecord::Migration
  def self.up
    sizes = %w[
      Small
      Medium
      Large
      XL
      XXL
      3XL
  ]
  sizes.each do |size|
    Size.new(:name => size).save!
  end
  
  end

  def self.down
  end
end
