class ChangeTypeToQType < ActiveRecord::Migration
  def self.up
    remove_column :questions, :type
    add_column :questions, :qtype, :string
  end

  def self.down
    remove_column :questions, :qtype, :string
    add_column :questions, :type
  end
end
