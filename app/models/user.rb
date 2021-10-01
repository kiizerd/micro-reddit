class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true,
                       length: { minimum: 3, maximum: 15 }
end
