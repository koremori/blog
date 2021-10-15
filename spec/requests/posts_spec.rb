require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "contains posts titles" do
      user = create :user
      post = create :post, user: user
      get :index
      expect(page).to have_content post.title
      expect(page).to have_content post.content
    end
  end
end
