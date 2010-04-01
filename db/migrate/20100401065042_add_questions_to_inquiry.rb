class AddQuestionsToInquiry < ActiveRecord::Migration
  def self.up
    add_column :questions, :inquiry_id, :integer
  end

  def self.down
    remove_column :questions, :inquiry_id
  end
end
