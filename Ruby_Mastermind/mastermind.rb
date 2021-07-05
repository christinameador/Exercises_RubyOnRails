require 'colorize'
require 'pry'
require_relative './display'
require_relative './input_checks'

class Mastermind
  include Display
  attr_accessor :round
  attr_reader :code

  def initialize
    @round = 1
    @code = nil
  end

  def play_game
    instructions
    choose_player
    play_again
  end

  private

  def choose_player
    choose_position
    input = gets.chomp
    case input
    when '1'
      guess_the_code
    when '2'
      puts 'Choose 4 digits ranging from 1-6'
      computer_plays
    end
  end

  def computer_plays
    code = valid_code(gets.chomp)
    until round > 12
      guess = cpu_generated_code
      puts guess
      round_output(round)
      guess_accuracy(guess, code)
      break if game_over?(guess, code)

      @round += 1
    end
    win_or_loss(game_over?(guess, code), code)
  end

  def guess_the_code
    code = cpu_generated_code
    until round > 12
      round_output(round)
      input = valid_input?(gets.chomp).to_i
      guess_accuracy(input, code)
      break if game_over?(input, code)

      @round += 1
    end
    win_or_loss(game_over?(input, code), code)
  end

  def cpu_generated_code
    [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join.to_i
  end

  def game_over?(input, cipher)
    input == cipher
  end

  def guess_accuracy(input, cipher)
    cipher_split = cipher.to_s.split('')
    input_split = input.to_s.split('')
    show_clues(exact_match?(input_split, cipher_split), contains_number(input_split, cipher_split))
  end

  def show_clues(exact, same)
    print 'Clues: '
    exact.times { print 'X'.blue }
    same.times { print 'O'.yellow }
    puts ''
  end

  def contains_number(input_split, cipher_split)
    same = 0

    input_split.each_index do |idx|
      next unless input_split[idx] != 'X' && cipher_split.include?(input_split[idx])

      same += 1
      remove = cipher_split.find_index(input_split[idx])
      cipher_split[remove] = 'O'
      input_split[idx] = 'O'
    end
    same
  end

  def exact_match?(input_split, cipher_split)
    exact = 0

    cipher_split.each_with_index do |val, idx|
      next unless val == input_split[idx]

      exact += 1
      cipher_split[idx] = 'X'
      input_split[idx] = 'X'
    end
    exact
  end

  def play_again
    conclusion
    input = gets.chomp.downcase
    if input == 'y'
      @round = 1
      choose_player
    else
      puts 'Have a great day!'
    end
  end
end
