module Stuff

	def build_regexp(keyword)
	  str = "/#{keyword}/i"
	  @regexp = Regexp.new(eval(str))
	  #@regexp = Regexp.new str
	end
  
end