class Word < ActiveRecord::Base
	has_many :uris

  #STOP_WORDS = %w{is a the and}
  STOP_WORDS = Stopword.all.map { |sw| sw.stop_word }

  def build_regexp(keyword)
    str = "/#{keyword}/i"
    @regexp = Regexp.new(eval(str))
  end

  def clean_word(wrd_to_strip)
    wrd_to_strip.gsub!(/\W+/, '')
  end

  def do_word_count(p)
    #a hash for processing word occurence in mem before write to DB
    @top_words_mem = {}
    #put the words into an array so they can be counted
    word_arr = p.para_text.split(" ")
    #clean the words up to remove spaces and punctuation
    word_arr.each do |str|
      clean_word(str)
      #remove stopwords
        #if str matches stopword then remove it from the array
        next if STOP_WORDS.include? str 
      #process the words array in mem before writing to the DB
      if @top_words_mem.include?(str.downcase)
        @top_words_mem[str.downcase] += 1
      else
        @top_words_mem[str.downcase] = 1
      end
    end
    #sort the hash by value
    @top_words_mem = Hash[@top_words_mem.sort_by{|k, v| v}.reverse]
    @top_words_mem.each do |w|
      #this loop is for dev only. It keeps the DB records down for debugging review
      if w[1] > 1 
        #write to DB

        #TODO make the following two variables use 'treat'
        @stem = w[0].class
        @pos_type = w[0].class
        @top_word = Wordcount.new(:keyword => "#{w[0]}", :keyword_stem => "#{@stem}", :pos_type => "#{@pos_type}", :count => "#{w[1]}", :paragraph_id => "#{p.id}")
        @top_word.save
      end          
    end
  end #end do_word_count

  def parse_para
    #use Nokogiri to get the page_source
    page_source = Nokogiri::HTML(open(@uri.uri))
    #parse all the paragraph text that includes the search term
    @scrape_arr_para = page_source.css('p')  
    @scrape_arr_para.each do |n|
      @holder = n.text.strip

      build_regexp(self.search_term)
        if @holder =~ @regexp
          #save all of the relevant paras to the DB
          @para = Paragraph.new(:para_text => "#{@holder}", :uri_id => "#{@uri.id}")
          @para.save
          #process the text for word count
          do_word_count(@para)
        end
      end
  end

	def save_and_process

    if self.save
      @results = Google::Search::Web.new(:query => self.search_term)
      @results.each do |result|
        #For Dev Only!! Limiting to 3 results for speed
        if result.index < 5
          @uri = self.uris.new(:uri => result.uri)
          @uri.save
          self.parse_para
        end
      end
    end 
     
	end #end save_and_process

end
