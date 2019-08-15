require 'types/mutation_type'
class TodosGraphqlApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
