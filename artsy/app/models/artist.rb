class Artist < ActiveRecord::Base
  has_many :artworks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :followers, through: :favorites, source: :user

  validates :first_name, :last_name, presence: true

  scope :most_recent, -> { order(updated_at: :desc) }

  paginates_per 5

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_thumbnail
    api_instance = ArtsyApiWrapper.new
    thumbnail = api_instance.artist_url
  end
end