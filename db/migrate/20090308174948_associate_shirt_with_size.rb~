class AssociateShirtWithSize < ActiveRecord::Migration
  def self.up
    add_column :shirts, :size_id, :integer
    remove_column :shirts, :size
  end

  def self.down
    remove_column :shirts, :size_id
    add_column :shirts, :size, :string
  end
end
