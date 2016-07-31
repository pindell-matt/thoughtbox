require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :title, presence: true
  validate :url_location

  def flip_status
    new_status = !read
    self.update_attributes({read: new_status})
  end

  private
    def url_location
      uri = URI.parse(url)
      unless uri.kind_of?(URI::HTTP)
        errors.add(:url, "Not a valid URL")
      end
      rescue URI::InvalidURIError
    end
end
