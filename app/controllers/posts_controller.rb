# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post::Index.new.call
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save!
      flash[:success] = 'Post created successfully'
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = find_post
  end

  def edit
    @post = find_post
    owner?
  end

  def update
    @post = find_post
    owner?

    if @post.update(post_params)
      flash[:success] = 'Post updated successfully'
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = find_post
    owner?
    @post.destroy
    flash[:success] = 'Post deleted successfully'
    redirect_to action: 'index'
  end

  private

  def find_post
    Post::Getter.new(params[:id]).call
  end

  def owner?
    unless current_user == @post.user
      redirect_back fallback_location: root_path
      flash[:alert] = 'User is not owner'
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
