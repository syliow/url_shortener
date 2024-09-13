class Url < ApplicationRecord
  before_create :generate_short_url
  before_save :set_default_title

  validates :target_url, presence: true

  def fetch_title
    self.title = "Title Not Available" if self.title.blank?
  end

  private

  def generate_short_url
    loop do
      # Generate a short URL using SecureRandom with a length of 4 characters (Because 64 ^ 4 has total combinations enough for this use case)
      # Why no UUID? - UUID is too long, we need to keep the short url as short as possible
      self.short_url = SecureRandom.urlsafe_base64(4)
      # Ensure the generated short URL is unique
      break unless Url.exists?(short_url: short_url)
    end
  end

  def set_default_title
    self.title = "Title Not Available" if self.title.blank?
  end
end

# Reference: https://ruby-doc.org/stdlib-2.5.1/libdoc/securerandom/rdoc/Random/Formatter.html
