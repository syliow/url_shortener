class Url < ApplicationRecord
    before_create :generate_short_url
  
    private
  
    def generate_short_url
        loop do
          self.short_url = SecureRandom.urlsafe_base64(6)
          break unless Url.exists?(short_url: short_url)
        end
      end
  end
  