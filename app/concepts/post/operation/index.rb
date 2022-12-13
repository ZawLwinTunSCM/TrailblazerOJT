module Post::Operation
  class Index < Trailblazer::Operation
    step :post_list

    def post_list(ctx, **)
      ctx[:model] = Post.all.order('id DESC')
    end
  end
end
