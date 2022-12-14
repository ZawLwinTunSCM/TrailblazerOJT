class RamdomJob < ApplicationJob
  queue_as :default
  require 'faker'

  def perform(*_args)
    post = Post.new
    post.title = Faker::JapaneseMedia::Doraemon.character
    post.body = Faker::JapaneseMedia::Doraemon.gadget
    post.save!
    sleep 5
  end
end
