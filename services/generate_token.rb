class GenerateToken
    def initialize(user)
      @user = user
    end
  
    def generate
        expires = Time.now.to_i + (3600 * 24 * 365 * 10)
        JWT.encode({ email: @user.email, exp: expires },Rails.application.secrets.secret_key_base, 'HS256')
    end

  end