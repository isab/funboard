class Funpost < ActiveRecord::Base
	validates :title, presence: true
	validates :url, presence: true, uniqueness: true
	validates_format_of :url, with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'
end
