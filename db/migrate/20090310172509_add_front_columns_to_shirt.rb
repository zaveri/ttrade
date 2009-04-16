class AddFrontColumnsToShirt < ActiveRecord::Migration
  def self.up
    add_column :shirts, :front_file_name, :string
    add_column :shirts, :front_content_type, :string
    add_column :shirts, :front_file_size, :integer
    add_column :shirts, :front_updated_at, :datetime
  end

  def self.down
    remove_column :shirts, :front_file_name
    remove_column :shirts, :front_content_type
    remove_column :shirts, :front_file_size
    remove_column :shirts, :front_updated_at    
  end
end
