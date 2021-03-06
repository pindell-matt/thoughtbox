class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :title, presence: true
  validates :url, url: true

  def flip_status
    new_status = !read
    self.update_attributes({read: new_status})
  end
end
