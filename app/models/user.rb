class User < ApplicationRecord
  has_secure_password
  has_many :users, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, uniqueness: true, presence: true, length: { in: 3..200 }
  validates :firstname, presence: true, length: { in: 2...200 }
  validates :lastname, presence: true, length: { in: 2...200 }
  validates :email, presence: true, uniqueness: true, email: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def user_favs(user, houses)
    favs = []
    houses.each do |hse|
      favs.push(hse) if hse.user_id == user.id
    end
    favs
  end
end
