require 'faker'

# User class factory
FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    superadmin { false }
  end
end

# Post class factory
FactoryBot.define do
  factory :post, class: Post do
    title { Faker::Lorem.sentence(word_count: 3) }
    content { Faker::Lorem.paragraphs }
    user
  end
end

# Comment class factory
FactoryBot.define do
  factory :comment, class: Comment do
    content { Faker::Company.bs }
    post
    user
  end
end
