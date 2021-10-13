# frozen_string_literal: true

class Post::Getter
  attr_reader :post_id

  def initialize(post_id)
    @post_id = post_id
  end

  def call
    Post.find(post_id)
  end
end
