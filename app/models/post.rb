class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :entry
  validates_presence_of :user_id
end
