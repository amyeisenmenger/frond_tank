class Comment < ActiveRecord::Base
  belongs_to :post, :user

  validate_presence_of :entry
  validate_presence_of :author_id
end
