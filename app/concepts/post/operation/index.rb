module Post::Operation
  class Index < Trailblazer::Operation
    step :post_list

    def post_list(ctx, **)
      if ctx['current_user'] == nil
        ctx[:model] = Post.where(public_flag: 1).order('id DESC')
      elsif ctx['current_user'] != nil
        ctx[:model] = Post.where(public_flag: 1).or (Post.where(public_flag: 2)).or (Post.where(user_id: ctx['current_user'][:id]))
      end
    end
  end
end
