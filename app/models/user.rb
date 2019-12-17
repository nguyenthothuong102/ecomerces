class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password
  enum role_id: {admin: 0, owner: 1, user: 2}
end
