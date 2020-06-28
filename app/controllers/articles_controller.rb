class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
          #redirect_to article_path(@article)
          flash[:notice] = "Article was saved successfully"
          redirect_to @article    #this also works same as above
        else 
            render 'new'
        end      
    end
end