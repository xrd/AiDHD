class User < ActiveRecord::Base
  has_many :inquiries
end
