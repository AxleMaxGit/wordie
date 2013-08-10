require 'nokogiri'
require 'open-uri'

#clear the CLI
puts `clear`

#request a keywork to search
puts "Enter a search term"
user_input = gets.chomp

#request a page to search in
# puts "Enter a URL to search"
# url = gets.chomp
url = "http://www.rmit.edu.au/courses/037926"


def build_regexp(keyword)
  str = "/#{keyword}/i"
  @regexp = Regexp.new(eval(str))
end

def top_words(holder)
  puts holder

end

#use Nokogiri to get the page_source
page_source = Nokogiri::HTML(open(url))

puts "This page title is : #{page_source.css('title').text.strip}"

#parse all the paragraph text
paras = page_source.css('p')

paras.each do |n|

  #if para contains keyword then display it
  holder = n.text.strip
  build_regexp(user_input)
  if holder =~ @regexp
    puts paras.index(n)
    #puts holder
    top_words(holder)
  end

 end

# #collect all the heading text
# puts page_source.css('h1').text.strip

# #collect just the first heading text
# puts page_source.at_css('h1').text.strip