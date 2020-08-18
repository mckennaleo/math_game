require_relative './player'
require_relative './question'

class Game 

  #constructor
  def initialize
    #create 2 players
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    #count turns
    @turn = 1
    @question1 = Question.new()
    @question2 = Question.new()
  end

    #play method - main game loop

  def next_round
    puts "----------"
    puts "Turn ##{@turn}"
    puts "----------"
    @turn += 1
    @question1 = Question.new()
    @question2 = Question.new()
  end

  def alive_players
    @players.select {|player| player.dead?}
  end

  def get_winner
    if alive_players.count == 1
      puts "The winner is #{alive_players.first.name}"
    else 
      puts "Draw! Both players died."
    end
  end

  def game_over
    alive_players.count >= 1 
  end

  def play
    until game_over do 
      
      next_round
      #p1 is asked a question
      active_player = @player1
      puts "#{active_player.name}'s turn"
      puts "----------"
      puts "#{@question1.question_ask}"
      puts "#{active_player.name}'s answer:"
      #p1 inputs answer
      a = gets.to_i
      if a == @question1.answer
        print "Correct! #{@question1.question_answer}"
        puts "#{active_player.name}'s hp: #{active_player.hp} / 3"
        #if wrong, he takes 1 dmg
      else 
        active_player.takes_damage(1)
        print "Incorrect! #{@question1.question_answer}"
        puts "#{active_player.name}'s hp: #{active_player.hp} / 3"
      end
      puts "----------"
      puts ""
      puts "----------"
      active_player = @player2
      puts "#{active_player.name}'s turn"
      puts "----------"
      puts "#{@question2.question_ask}"
      puts "#{active_player.name}'s answer:"
      #p1 inputs answer
      a = gets.to_i
      if a == @question2.answer
        print "Correct! #{@question2.question_answer}"
        puts "#{active_player.name}'s hp: #{active_player.hp} / 3"
        #if wrong, he takes 1 dmg
      else 
        active_player.takes_damage(1)
        print "Incorrect! #{@question2.question_answer}"
        puts "#{active_player.name}'s hp: #{active_player.hp} / 3"
      end
      
    end
    get_winner
    
  end
end