class User < ApplicationRecord
    before_validation :ensure_session_token

    attr_reader :password

    validates :username, :password_digest, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    # validates :password


    def self.find_by_credentials?(username, password)
        @user = User.find_by(username: username)

        @user.is_password?(password) ? @user : nil
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

end
