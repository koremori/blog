User.create!(email: 'test@test.com',
             password: '123123',
             password_confirmation: '123123') if Rails.env.development?

3.times do |post|
  Post.create!(
    title: "My post #{post}",
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    user_id: 1,
  ) if Rails.env.development?
end

Post.last.comments.create!([{ content: 'This is a very good post', user_id: 1 },
                            { content: 'I agree with all of this', user_id: 1 },
                            { content: 'I do not agree with all of this', user_id: 1 }])
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', superadmin: true) if Rails.env.development?
