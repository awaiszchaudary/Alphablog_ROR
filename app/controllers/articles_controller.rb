class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:notice] = "Article has been created successfully."
      redirect_to articles_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to article_path(@article)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy

    @article.destroy
    flash[:notice] = "Article deleted successfully"
    redirect_to articles_path

  end

  private

    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def require_user
      if !user_signed_in?
        flash[:alert] = "You must be loggedin to perform this action."
        redirect_to new_user_session_path
      end
    end

    def require_same_user
      if current_user.id != @article.user.id
        flash[:alert] = 'You can only edit or delete your article.'
        redirect_to articles_path
      end      
    end

    


end
