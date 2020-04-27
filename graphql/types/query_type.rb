Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  
  field :test_hello_world, types.String do
    resolve(lambda do |_obj, _args, _ctx|
      ("Hello World!")
    end)
  end

  field :test, types.String do
    resolve(lambda do |_obj, _args, _ctx|
      User.find(1).name
    end)
  end
end