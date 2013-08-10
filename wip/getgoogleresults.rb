$:.unshift File.dirname(__FILE__) + '/../lib'

require 'google-search'
results = Google::Search::Web.new(:query => "Enterprise Architecture")
 
puts results

#results.each { |r|  puts r.uri }