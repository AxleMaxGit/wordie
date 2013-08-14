class WordsController < ApplicationController

	def index
		@words = Word.all
	end

	def show
		@counter = 1
		@word = Word.find(params[:id])
		#@results = Uri.all 
		@results = Uri.where("word_id = ?", params[:id])
	end

	def new 
		@word = Word.new
	end

	def create
		@word = Word.new(params.require(:word).permit(:search_term))

    if @word.save

    	@results = Google::Search::Web.new(:query => @word.search_term)
	
			@results.each do |result|
				@uri = @word.uris.new(:uri => result.uri)
				@uri.save
			end
    	redirect_to word_path(@word)
  	end

	end #end create

end
