class Paragraph < ActiveRecord::Base
	belongs_to :uri
	has_many :wordcounts
end
