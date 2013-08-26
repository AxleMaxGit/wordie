class StopwordsController < ApplicationController

  def create

    #the next two lines aren't really necessary they just write the stopwords to the DB
    @stopword = Stopword.new(params.require(:stopword).permit(:stop_word))
    @stopword.save

    #this is a crude method because it can't be reversed
    Wordcount.where(:keyword => params[:stopword][:stop_word]).destroy_all

    redirect_to :back

  end #end create

end
