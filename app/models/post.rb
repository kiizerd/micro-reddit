class Post < ApplicationRecord
  include Validators

  has_many :comments

  belongs_to :user

  validates :title, presence: true

  validates_with PostValidator
end
