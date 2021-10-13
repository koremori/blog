# frozen_string_literal: true

class Post::Index
  def call
    Post.all
  end
end
