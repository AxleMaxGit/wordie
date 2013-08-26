class Uri < ActiveRecord::Base
	belongs_to :word
	has_many :paragraphs
  has_many :wordcounts, :through => :paragraphs

  def uri_word_count
    #select('sum(*)').joins('wordcounts').group('keyword')
    #uri.wordcounts.group_by { |wc| wc.keyword }.inject({}) { |h (k,wordcounts)| h[k] = wordcounts.sum { |wc| wc.count } }
  end
end
