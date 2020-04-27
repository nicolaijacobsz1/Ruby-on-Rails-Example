module Types
    ProfileType = GraphQL::ObjectType.define do
      name 'profile'
      description 'a profile'
      field :user, Types::UserType
      field :time_zone, types.String
      field :language, types.String
      field :profile_image_id, types.String
      field :latitude, types.String
      field :longitude, types.String
      field :location, types.String
      field :last_seen_at, types.String
      field :do_not_disturb, types.Boolean
      field :location_enabled, types.Boolean
    end
  end