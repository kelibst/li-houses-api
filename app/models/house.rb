class House < ApplicationRecord
  belongs_to :user
  before_save :slugify

  validates :name, uniqueness: true, presence: true, length: { in: 3..200 }
  validates_presence_of :country, :address, :region, :location

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def slugify
    self.slug = name.parameterize
  end
end
