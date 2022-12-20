module User::Operation
    class Login < Trailblazer::Operation
      class Present < Trailblazer::Operation
        step Model(User, :new)
        step Contract::Build(constant: User::Contract::Login)
      end
      step Nested(Present)
      step Contract::Validate(key: :user)
      step :model!

      def model!(ctx, params:, **)
        user = User.find_by(email: params[:user][:email])
        if user && user.valid_password?(params[:user][:password])
          ctx['user'] = user
          ctx['remember_me'] = params[:user][:remember_me]
        end
      end
    end
  end
  