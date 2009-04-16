class CreateShirts < ActiveRecord::Migration
  def self.up
    create_table :shirts do |t|
      t.string :description
      t.string :size
      t.string :gender
      
      t.timestamps
    end
  end

  def self.down
    drop_table :shirts
  end
end
