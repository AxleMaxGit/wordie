$:.unshift File.dirname(__FILE__) + '/../lib'

require 'google-search'
#require 'json'
#require 'rubygems'

#Some queries to test
user_query1 = "allinurl:Business Design"
#alinthetitle can not be used with other params
user_query2 = "allintitle:\"Business Architecture\" -site:http://bawg.omg.org/"
user_query3 = "Enterprise Architecture daterange:2453006-2453371 filetype:html"

#set an array of queries to enumerate
queries = [user_query1, user_query2, user_query3]


def get_search_Results(user_query)

  #get an array with search results
  @search = Google::Search::Web.new :query => user_query

  #extract the results hash  
  main_hash = @search.get_hash

  #catches an array of results similar to the google search top 10 page
  results_arr = main_hash['responseData']['results']

  #Pick out the URL from each result and display it
  for current_iteration_number in 0..(results_arr.count-1) do
   result_url = results_arr[current_iteration_number]['url']
   puts results_arr[current_iteration_number]['title']
   puts result_url
  end
end

#clear the CLI
puts `clear`

#get the uris for each search
queries.each do |user_query|
  puts "\nResults for #{user_query}: \n\n"
  get_search_Results(user_query)
end




