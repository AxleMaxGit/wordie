class Word < ActiveRecord::Base
	has_many :uris

  def build_regexp(keyword)
    str = "/#{keyword}/i"
    @regexp = Regexp.new(eval(str))
  end

  def parse_para
    puts "#######  PARSE ##############"
    #use Nokogiri to get the page_source
    page_source = Nokogiri::HTML(open(@uri.uri))
    #Debugging text
    puts "#######  #{@uri.to_json} ##############"
    #parse all the paragraph text that includes the search term
    @scrape_arr_para = page_source.css('p')  
    @scrape_arr_para.each do |n|
      @holder = n.text.strip
      build_regexp(self.search_term)
        if @holder =~ @regexp
          puts @holder
          #save all of the relevant paras to the DB
          @para = Paragraph.new(:para_text => "#{@holder}", :uri_id => "#{@uri.id}")
          @para.save
          #Debugging text in the console
          puts @para.id
          puts " #################################"
        end
      end
  end

	def save_and_process

    if self.save
      @results = Google::Search::Web.new(:query => self.search_term)
      @results.each do |result|
        if result.index < 2
          @uri = self.uris.new(:uri => result.uri)
          @uri.save
          self.parse_para
        end
      end
    end 
     
	end #end save_and_process

end
