# frozen_string_literal: true
module Types
  UserType = GraphQL::ObjectType.define do
    name 'User'
    description 'a user'
    field :id, types.ID
    field :name, types.String
    field :email, types.String
    field :phone_number, types.String
    field :profile, Types::ProfileType
    field :token, types.String do
      resolve(lambda do |user, _args, ctx|
        # Check whether there's token inside header
        # If Authorization header is empty, generate new token
        # Else, return back the token from header
        if ctx[:token].blank?
          GenerateToken.new(user).generate
        else
          ctx[:token]
        end    
      end)
    end

    field :unavailable_times, types[Types::UnavailableType] do
      description  'List of do not disturb times.'
      resolve(lambda do |user, _args, ctx|
        user.do_not_disturbs if (user.do_not_disturbs.present?)    
      end)
    end
  end
end