ActiveAdmin.register Comment, as: "PostsComment" do
  permit_params :content, :blog_id, :user_id
end
