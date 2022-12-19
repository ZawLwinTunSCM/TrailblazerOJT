module Post::Operation
  class Index < Trailblazer::Operation
    step :post_list

    def post_list(ctx, **)
      if ctx['current_user'] == nil
        ctx[:model] = Post.where(status: 1).order('created_at DESC')
      elsif ctx['current_user'] != nil
        ctx[:model] = Post.where(status: 1).or (Post.where(status: 2)).or (Post.where(user_id: ctx['current_user'][:id]))
      end
    end
  end
end
