  def greeting
  puts 'TIC TAC TOE GAME'
  puts 'TO START PRESS ENTER'
  gets.chomp
end

puts greeting

puts 'Please enter Player 1 name'
name1 = gets.chomp.to_s
until name1.match(/\w{1,10}/)
  puts 'Enter a valid name'
  name1 = gets.chomp.to_s 
  end
player1 = Player.new(name1)

puts "\nPlease enter Player 2 name"
name2 = gets.chomp.to_s
until name2.match(/\w{1,10}/)
  puts 'Enter a valid name'
  name2 = gets.chomp.to_s
end
player2 = Player.new(name2)

puts "\n#{player1.name.capitalize} will play as X and #{player2.name.capitalize} will play as O"
sleep 1
puts "\nLet's play!"

slots = [1, 2, 3, 4, 5, 6, 7, 8, 9]
player1_arr = []
player2_arr = []

puts check_win(player1_arr, winning_numbers)

def player_turn(arr, name, symbol, remaining_slots, player_arr)
  puts "#{name.capitalize} is your turn to play, choose one of the remaining slots #{remaining_slots}"
  choice = gets.chomp.to_i
  until remaining_slots.include?(choice)
    puts 'Enter a valid number'
    choice = gets.chomp.to_i
  end
  player_arr.push(choice)
  arr.map! do |item|
    if item == choice
      arr[arr.index(item)] = symbol
    else
      item
    end
  end
end

def clear
  system('clear')
  system('cls')
end

new_game = Game.new(player1, player2)
new_game.start_game(slots, player1_arr, player2_arr, winning_numbers)

puts 'this line is supposed to be 120 characters length, this line has a space at the end. Please delete the spac after' 