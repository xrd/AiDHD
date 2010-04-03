class Inquiry < ActiveRecord::Base
  named_scope :current, :conditions => [ 'status <> "closed"' ]
  belongs_to :user
  has_many :questions
  validates_presence_of :user_id, :title

end
