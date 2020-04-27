# frozen_string_literal: true
module Types
  UnavailableType = GraphQL::ObjectType.define do
    name 'UnavailableType'
    description ''
    field :id, types.ID
    field :from_time, types.String
    field :to_time, types.String
    field :days, types[types.String]

  end
end