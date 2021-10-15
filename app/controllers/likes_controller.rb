# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = find_post
    @like = @post.likes.create(user: current_user)

    if @like.save!
      flash[:success] = 'Liked'
    else
      flash[:error] = 'Error'
    end

    redirect_to @post
  end

  def destroy
    @post = find_post
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_to @post
  end

  private

  def find_post
    Post::Getter.new(params[:post_id]).call
  end
end
