module Mutations
  UserMutation = GraphQL::ObjectType.define do
    name 'UserMutation'
    description 'Mutation type for user'


    field :sign_in_user, function: Mutations::SignInUser.new
  end
end