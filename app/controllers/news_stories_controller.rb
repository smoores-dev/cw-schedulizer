class NewsStoriesController < ApplicationController
  def new
    @news_story = NewsStory.new
  end

  def create
    @news_story = NewsStory.new(news_story_params)
    if @news_story.save
      flash[:success] = "News story added."
    end
    redirect_to about_path
  end

  def destroy
    NewsStory.find(params[:id]).destroy
    flash[:success] = "Story deleted"
    redirect_to about_path
  end

  private

    def news_story_params
      params.require(:news_story).permit(:title, :snippet, :url)
    end
end
