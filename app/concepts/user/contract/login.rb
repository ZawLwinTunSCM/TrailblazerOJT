module User::Contract
    class Login < Reform::Form
      property :email
      property :password
      property :remember_me

      validates :email, presence: { message: ' Email cannot be empty!' }
      validates :password, presence: { message: ' Password cannot be empty!' }
    end
  end
  