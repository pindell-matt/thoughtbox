require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :title, presence: true
  validate :url_location

  private
    def url_location
      uri = URI.parse(url)
      unless uri.kind_of?(URI::HTTP)
        errors.add(:url, "Not a valid URL")
      end
      rescue URI::InvalidURIError
    end
end
