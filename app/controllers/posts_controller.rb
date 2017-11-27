class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: 'desc')
    @drafts = Draft.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @draft = Draft.new
  end

  def create
    @post = Post.new(post_params)
    @draft = Draft.new(draft_params)
    if params[:preview_button] || !@post.save || !@draft.save
      render 'new'
    elsif params[:draft_button]
      @draft.save
      @post.destroy
      render 'drafts/show'
    else params[:release_button]
      @post.save
      @draft.destroy
      render 'show'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # render plain: params[:post].inspect
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @draft = Draft.new(draft_params)
    if params[:preview_button]|| !@post.update(post_params) || !@draft.save
      render 'edit'
    elsif params[:draft_button]
      @draft.save
      @post = Post.find(params[:id])
      @post.destroy
      render 'drafts/show'
    else
      @post.update(post_params)
      render 'show'
      @draft.destroy
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def draft_params
    params.require(:post).permit(:title, :body)
  end

end
