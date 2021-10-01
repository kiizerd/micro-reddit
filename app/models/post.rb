class Post < ApplicationRecord
  include Validators

  belongs_to :user

  validates :title, presence: true

  validates_with PostValidator
end
