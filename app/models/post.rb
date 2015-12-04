class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validate_presence_of :entry
  validate_presence_of :author_id
end
