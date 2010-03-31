class Inquiry < ActiveRecord::Base
  named_scope :current, :conditions => [ 'status = ?', 'open' ]
  belongs_to :user

  validates_presence_of :user_id
end
