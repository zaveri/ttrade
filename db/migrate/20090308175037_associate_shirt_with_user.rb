class AssociateShirtWithUser < ActiveRecord::Migration
  def self.up
    add_column :shirts, :user_id, :integer
  end

  def self.down
    remove_column :shirts, :user_id
  end
end
