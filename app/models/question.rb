class Question < ActiveRecord::Base
  has_many :choices
  validates_presence_of :title, :qtype
end
