#2015-01-26 (Day 1)
#CheckSplitter 

require 'pry'

class Checksplitter
  def initialize(amt, perc_tip, num_people)
    @amt = 200.00
    @perc_tip = 20
    @num_people = 6
  end   
  def set_amt
    puts "What is the amount of your bill?"
    @amt = gets.chomp.to_f 
  end
  def set_perc_tip
    puts "What percent tip would you like to include?"
    @perc_tip = gets.chomp.to_i 
  end
  def set_num_people
    puts "How many people are in your party?"
    @num_people = gets.chomp.to_i 
  end
  def display
  	puts "Each person in your group of " + @num_people.to_s 
  	puts "should pay: $" + ((@amt + (@amt * (@perc_tip * 0.01))) / @num_people).to_s
	end	
end
binding.pry