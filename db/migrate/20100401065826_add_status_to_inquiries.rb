class AddStatusToInquiries < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :status, :string
  end

  def self.down
    remove_column :inquiries, :status
  end
end
