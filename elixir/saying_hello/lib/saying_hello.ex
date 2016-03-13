defmodule SayingHello do
  defmodule CLI do
    def main(_args) do
      name = IO.gets "What is your name?"
      IO.puts "Hello, #{name}, nice to meet you!"
    end
  end
end
