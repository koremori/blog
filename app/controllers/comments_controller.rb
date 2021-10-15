# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = find_post
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save!
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Failed to create comment'
    end
    redirect_to @post
  end

  def destroy
    @post = find_post
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to action: 'show'
  end

  private

  def find_post
    Post::Getter.new(params[:post_id]).call
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
