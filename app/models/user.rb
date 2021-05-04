class User < ActiveRecord::Base
    
    has_secure_password

    # These routes will be for signup. The first renders a form in the browse, the second will 
    # receive the form and create a user in our database using the data given to us by the user.
    # get '/signup' => 'users#new'
    # post '/users' => 'users#create'
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, :uniqueness => { :case_sensitive => false }
    validates :password_digest, presence: {on: create}
    validates :password, :length => { :minimum => 5 }

    def authenticate_with_credentials(email, password)
        user = User.find_by_email(email)
        if user && user.authenticate(password)
          user
        else
          nil
        end
    end

end
