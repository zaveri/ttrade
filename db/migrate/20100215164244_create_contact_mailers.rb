class CreateContactMailers < ActiveRecord::Migration
  def self.up
    create_table :contact_mailers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_mailers
  end
end
