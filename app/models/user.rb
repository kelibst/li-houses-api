class User < ApplicationRecord
 has_secure_password
 validates :username, presence: true,  length: { in: 3..200 }
 validates :email, presence: true,uniqueness: true
end
