class AssociateShirtWithGender < ActiveRecord::Migration
  def self.up
    add_column :shirts, :gender_id, :integer
    remove_column :shirts, :gender
  end

  def self.down
    remove_column :shirts, :gender_id
    add_column :shirts, :gender, :string
  end
end
