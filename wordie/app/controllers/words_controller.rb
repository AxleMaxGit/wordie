class WordsController < ApplicationController

    #commented out for dev. Reinstate for release.
    #before_filter :authenticate_user!, :only => [:new] 

	def index
		@words = Word.all
	end

	def new 
		@word = Word.new
	end #end new

	def create
    @word = Word.new(params.require(:word).permit(:search_term))
    @word.save_and_process
    redirect_to word_path(@word)
	end #end create

  def show
    @counter = 1
    @word = Word.find(params[:id])
    #@results = Uri.where("word_id = ?", params[:id])
    @results = @word.uris

    #code here that for_each results.id {load the paras}
    @p_results = Paragraph.all

    #you aren't passing he uri ID !!
    #@paras = Paragraph.where("uri_id = ?", 1)
  end #end show

end
