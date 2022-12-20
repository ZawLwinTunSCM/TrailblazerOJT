module User::Contract
  class Create < Reform::Form
    property :name
    property :email
    property :password
    property :password_confirmation

    validates :name, presence: { message: ' Name cannot be empty!' },
                     length: { minimum: 3, message: ' Name must be at least 3 characters long' }
    validates :email, presence: { message: ' Email cannot be empty!' }
    validates :password, presence: { message: ' Password cannot be empty!' }
    validates :password_confirmation, presence: { message: ' Password Confirmation cannot be empty!' }
  end
end
