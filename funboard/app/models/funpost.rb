class Funpost < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings

	validates :title, presence: true
	validates :url, presence: true, uniqueness: true
	validates :all_tags, presence: true
	validates_format_of :url, with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'

	def all_tags=(names)
	  self.tags = names.split(",").map do |name|
	    Tag.where(name: name.strip).first_or_create!
	  end
	end
	   
	def all_tags
	  self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
	  Tag.find_by_name!(name).funposts
	end

end
