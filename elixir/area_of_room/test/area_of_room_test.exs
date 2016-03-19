defmodule AreaOfRoomTest do
  use ExUnit.Case
  doctest AreaOfRoom

  test "calculates metric area of a room" do
    assert AreaOfRoom.CLI.area_in_meters(300) == 27.871
  end

  test "it calulates the square feet of a room" do
    assert AreaOfRoom.CLI.area_in_feet(15, 20) == 300
  end
end
