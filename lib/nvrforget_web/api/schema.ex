defmodule NvrforgetWeb.Api.Schema do
  use Absinthe.Schema
  alias Nvrforget.Todos

  object :todo_item do
    # ID!
    field :id, non_null(:id)
    field :content, non_null(:string)

    field :is_completed, non_null(:boolean) do
      resolve fn %{completed_at: completed_at}, _, _ ->
        {:ok, !is_nil(completed_at)}
      end
    end
  end

  mutation do
    field :create_todo_item, non_null(:boolean) do
      arg :content, non_null(:string)

      resolve(fn %{content: content}, _ ->
        case Todos.create_item(%{content: content}) do
          {:ok, %Todos.Item{}} ->
            {:ok, true}
          _ ->
            {:ok, false}
        end
      end)
    end
  end

  query do
    field :hello, :string do
      resolve(fn _, _ ->
        {:ok, "Hello World!!"}
      end)
    end

    # [TodoItem!]!
    field :todo_items, non_null(list_of(:todo_item)) do
      resolve(fn _, _ ->
        {:ok, Todos.list_items()}
      end)
    end
  end
end
