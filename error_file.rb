class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

def check_win(player_arr, winning_array)

  control = false
  for array in winning_array do

    control = true if array.all? { |num| player_arr.include?(num) }
  end
  control
end

puts "this line is supposed to be 120 characters length, this line is supposed to be 120 characters. delete last char #"

def design_board(slots)
"    ¤---¤---¤---¤
    ¦ #{slots[0]} ¦ #{slots[1]} ¦ #{slots[2]} ¦
    ¤---¤---¤---¤
    ¦ #{slots[3]} ¦ #{slots[4]} ¦ #{slots[5]} ¦
    ¤---¤---¤---¤
    ¦ #{slots[6]} ¦ #{slots[7]} ¦ #{slots[8]} ¦
    ¤---¤---¤---¤"
  end