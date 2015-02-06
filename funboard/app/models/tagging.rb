class Tagging < ActiveRecord::Base
  belongs_to :funpost
  belongs_to :tag
end
