class DraftsController < ApplicationController

  def show
    @draft = Draft.find(params[:id])
  end
  def edit
    @draft = Draft.find(params[:id])
  end

  def update
    @draft = Draft.find(params[:id])
    @draft.title = params[:draft][:title]
    @draft.body = params[:draft][:body]
    @post = Post.new(post_params)
    if params[:preview_button]|| !@post.save || !@draft.update(post_params)
      render 'drafts/edit'
    elsif params[:draft_button]
      @draft.update(draft_params)
      render 'drafts/show'
      @post.destroy
    else
      @post.save
      render 'posts/show'
      @draft.destroy

    end
  end

  def destroy
    @draft = Draft.find(params[:id])
    @draft.destroy
    redirect_to posts_path

  end

  private
  def draft_params
    params.require(:draft).permit(:title, :body)
  end

  def post_params
    params.require(:draft).permit(:title, :body)
  end

end
