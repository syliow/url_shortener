class Url < ApplicationRecord
  before_create :generate_short_url

  validates :target_url, presence: true

  def fetch_title
    self.title = "Title Not Available" if self.title.blank?
  end

  private

  def generate_short_url
    loop do
      # Generate a short URL using SecureRandom with a length of 6 characters
      self.short_url = SecureRandom.urlsafe_base64(6)
      # Ensure the generated short URL is unique
      break unless Url.exists?(short_url: short_url)
    end
  end
end