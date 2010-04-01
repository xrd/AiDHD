class Inquiry < ActiveRecord::Base
  named_scope :current, :conditions => [ 'status = ?', 'open' ]
  belongs_to :user
  has_many :questions
  accept_nested_attributes_for :questions #, :allow_destroy => true
  validates_presence_of :user_id
end
