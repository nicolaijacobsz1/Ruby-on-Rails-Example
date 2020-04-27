Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  ### USER
  # MUTATION: SIGN UP
  field :sign_up, Types::UserType do
    argument :name, !types.String
    argument :phone_number, types.String
    argument :email, !types.String
    argument :password, !types.String
    resolve(lambda do |_obj, args, _ctx|
      Rails.logger.info " ####### MUTATION: SIGN UP"
      params = args.to_h.symbolize_keys
        user = User.new(params)
        if user.save
           user
        else
          GraphQL::ExecutionError.new user.errors.full_messages.join(" , ")
        end
    end)
  end

  # MUTATION: SIGN IN
  field :sign_in, Types::UserType do
    argument :phone_number, !types.String
    argument :password, !types.String
    resolve(lambda do |_obj, args, _ctx|
      Rails.logger.info " ####### MUTATION: SIGN IN"
      user =  User.find_for_database_authentication(phone_number: args[:phone_number]) 
      if user
        if user.valid_password? args[:password]
          user
        else 
          GraphQL::ExecutionError.new "invalid password"
        end
      else 
        GraphQL::ExecutionError.new "invalid phone number"
      end
    end)
  end

  field :forgot_password, types.String do
    argument :new_password, !types.String
    argument :password_confirmation, !types.String
    argument :phone_number, !types.String

    resolve(lambda do |_obj, args, _ctx|
      Rails.logger.info " ####### MUTATION: SIGN IN"
      user = User.find_by(phone_number: args[:phone_number])
      if user && args[:new_password].eql?(args[:password_confirmation])
        user.update(encrypted_password: args[:password])
        user
      else
        GraphQL::ExecutionError.new "You are not allowed to perform this action."
      end    
    end)
  end

  ### DO NOT DISTURB
  field :create_unavailable_time, Types::UnavailableType do
    description 'To set do not disturb time'
    argument :time_zone_id, !types.ID
    argument :from_time, !types.String
    argument :to_time, !types.String
    argument :days, !types[types.String]
    
    resolve(lambda do |_obj, args, ctx|
      params = args.to_h
      user =  ctx[:current_user]
      unavailable_time = user.do_not_disturbs.new(params)
        if unavailable_time.save
          unavailable_time
        else 
          GraphQL::ExecutionError.new unavailable_time.errors.full_messages.join(' , ')
        end

    end)
  end
end