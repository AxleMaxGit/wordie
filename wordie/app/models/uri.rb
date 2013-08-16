class Uri < ActiveRecord::Base
	belongs_to :word
	has_many :paragraphs

end
