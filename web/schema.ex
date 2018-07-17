defmodule GraphqlSample.Schema do
use Absinthe.Schema
import_types GraphqlSample.Schema.Types

input_object :update_post_params do
  field :title, non_null(:string)
  field :body, non_null(:string)
  field :user_id, non_null(:integer)
end

query do
  field :posts, list_of(:post) do
    resolve &GraphqlSample.PostResolver.all/2
  end

  field :users, list_of(:user) do
    resolve &GraphqlSample.UserResolver.all/2
  end
end

mutation do
  field :create_post, type: :post do
    arg :title, non_null(:string)
    arg :body, non_null(:string)
    arg :user_id, non_null(:integer)
  
    resolve &GraphqlSample.PostResolver.create/2
  end

  field :update_post, type: :post do
    arg :id, non_null(:integer)
    arg :post, :update_post_params

    resolve &GraphqlSample.PostResolver.update/2
  end

  field :delete_post, type: :post do
    arg :id, non_null(:integer)

    resolve &GraphqlSample.PostResolver.delete/2
  end
end
end
