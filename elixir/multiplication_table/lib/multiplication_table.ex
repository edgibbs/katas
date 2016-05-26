defmodule MultiplicationTable do
  defmodule CLI do
    def main(_args) do
      for number1 <- 0..12 do
        for number2 <- 0..12 do
          IO.puts "#{number1} X #{number2} = #{number1 * number2}"
        end
      end
    end
  end
end
