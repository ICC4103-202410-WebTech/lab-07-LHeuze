# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
ActiveRecord::Base.connection.execute("DELETE FROM post_tags WHERE post_id IN (SELECT id FROM posts)")
Post.destroy_all
User.destroy_all
Tag.destroy_all

User.create(name: "John Doe", email: "john.doe@example.com", password: "password123")

4.times do |n|
  User.create(
    name: "User #{n + 1}",
    email: "user#{n + 1}@example.com",
    password: "password"
  )
end

tag_names = ["Funny", "Sad", "Art", "Food", "Travel"]
tag_names.each do |name|
  Tag.find_or_create_by(name: name)
end

users = User.all
tags = Tag.all

10.times do |n|
    user = users.sample
    post = user.posts.create(
      title: "Post #{n + 1}",
      content: "This is the content of Post #{n + 1}",
      published_at: Time.current
    )
    tags.sample(2).each do |tag|
      post.tags << tag
    end
  end
