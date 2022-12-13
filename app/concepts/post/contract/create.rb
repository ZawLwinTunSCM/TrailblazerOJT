module Post::Contract
  class Create < Reform::Form
    property :title
    property :body

    validates :title, presence: { message: ' Title cannot be empty!' },
                      length: { minimum: 3, message: ' Title must be at least 3 characters long' }
    validates :body, presence: { message: ' Body cannot be empty!' }
  end
end
