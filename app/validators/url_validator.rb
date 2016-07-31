require 'uri'

class UrlValidator < ActiveModel::Validator
  def validate(link)
    uri = URI.parse(link.url)
    link.errors.add(:url, "Not a valid URL") unless uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
  end
end
