#clear the CLI
puts `clear`

str = "Enterprise architecture principles and purpose; modelling approaches for enterprise architecture definition and communication; key enterprise architecture approaches, standards, and frameworks; best practice processes of development of enterprise architecture, including key success factors; analysis of alternative models for enterprise architectures components of enterprise architecture processes and the implications of inadequate implementation; best practice approaches and models for documenting enterprise architectures; appropriate interaction with stakeholders when developing and communicating enterprise architectures; team formulation, dynamics & diagnostics. [Critical analysis] Evaluate alternative enterprise architecture approaches; identify and evaluate gaps and opportunities in different enterprise architecture models and processes; and identify critical success factors for common enterprise architect approaches. [Problem solving] Apply skills to develop appropriate enterprise architecture principles, models of different aspects of the enterprise architecture processes and artefacts, and architectures at different levels, including conceptual and technical. "

words = str.split(" ")

#clean up the array by removing the non letter characters
words.each do |t|
  t.gsub!(/\W+/, '')
end

#create a hash to store the number of times each words appears
top_words = {}

words.each {|x| 

	if top_words.include?(x.downcase)
		#puts "<<<<< #{x}"
		top_words[x.downcase] += 1
	else
		#puts "^^^^ #{x}"
		puts top_words[x.downcase]
		top_words[x.downcase] = 1
	end
	}

  #sort the hash to show highest counts first
  top_words_sort = top_words.sort_by {|_key, value| value}.reverse

  top_words_sort.each 
    if <condition> 
      
    end
  #puts words[0] + " " + words[1]
  #puts top_words