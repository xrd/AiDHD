class CreateInquiries < ActiveRecord::Migration
  def self.up
    create_table :inquiries do |t|
      t.integer :user_id
      t.string :title
      t.string :access
      t.timestamps
    end
  end

  def self.down
    drop_table :inquiries
  end
end
