class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_presence_of :username
  validates_uniqueness_of :username

end
