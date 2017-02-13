class Link < ActiveRecord::Base
  validates :url, :url => true
  validates :url, presence: true
  validates :title, presence: true


end
