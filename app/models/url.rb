class Url < ActiveRecord::Base
  validates :original_url, presence: true
  validates :shortened_url, presence: true
  validates :redirect_count, presence: true
end
