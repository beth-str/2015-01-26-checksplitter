# CheckSplitter w/ Dinner Club
# Incomplete:
#   does not track who attended which event 
#   does not include treater method 

#require 'pry'

#------------------------------------------------
# Class: DinnerClub
#
# Creates various dining groups
#
# Attributes:
# @total_pay    -   Float: the amount an individual has payed (running total)
# @event_list   -   Array: list of various events the particular club has had
# @members      -   Hash: members's name (string) ==> total paid (float)
# 
# Public Methods:
# #reconcile
# #create_new_event
# #add_member
class DinnerClub
  attr_accessor :event_list, :members, :attendees, :date, :restaurant

# Private: #initialize
# Initializes the class (invoked when new is called)
  def initialize(*name)
    @total_pay = 0.0
    @event_list = Array.new
    @members = Hash.new
    name.each {|member| @members[member] = 0.0} #hash to track payments
  end

# Public: #add_member
# Adds a new member to the DinnerClub 
#
# Parameters:  
# name          -   Member: one member of the club
#
# Returns:   
# Nothing
#
# State Changes:
# Creates a new member?
  def add_member(name)
    @members[name] = 0.0
  end

# Public: #create_new_event
# Creates a new event for the DinnerClub 
#
# Parameters:  
# date          -   String: date of the event
# restaurant    -   String: restaurant where the club went to eat
# attendees     -   Array of names (strings) of those who attended the event
#
# Returns:   
# Prints array of attendees
#
# State Changes:
# None?
  def create_new_event(date, restaurant, *attendees)
    @restaurant = restaurant
    @date = date
    # @event_list << [date, restaurant, amount]
    @attendees = Array.new   #array to determine # of attendees
    attendees.each {|attendee| @attendees.push(attendee)}
    puts @attendees
  end  

# Public: #reconcile
# Uses CheckSplitter to determine the amount each person paid at this event 
# Not sure how to enter this info since it calls another method??
#
# Parameters:  
# amt           -   Integer: total amount of the bill from that event
# tip           -   Integer: percent amount of the tip to be added to bill
#
# Returns:   
# Nothing
#
# State Changes:
# None?
  def reconcile(amt, tip)
    cs = CheckSplitter.new(attendees.length, amt, tip)
    pay_each_person = cs.pay_each_person
    attendees.each do |attendee| 
      if
        @members[attendee] += pay_each_person
      else
        @members[attendee] = pay_each_person
      end
    end
    @members
  end
end
#-------------------------------------------------

# Class: CheckSplitter
#
# Calculates an amount for each person to pay, using the total bill amount,
# the tip they desire to add to the bill, and the number of people paying.
#
# Attributes:
# @total_pay    -   Float: the amount an individual has payed (running total)
# @event_list   -   Array: list of various events the particular club has had
# @members      -   Hash: members's name (string) ==> total paid (float)
# 
# Public Methods:
# #pay_each_person
class CheckSplitter
  attr_accessor :num_attendees, :amt, :perc_tip 

# Private: #initialize
# Initializes the class (invoked when new is called)
  def initialize(num_attendees, amt, perc_tip)
    @num_attendees = num_attendees
    @amt = amt
    @perc_tip = perc_tip * 0.01
  end   
  # def total_cost
  #   @total_cost = ((amt * perc_tip) + amt)
  # end

# Public: #pay_each_person
# Determines that each individual should pay in order to split the bill evenly.
#
# Parameters:  
# None
#
# Returns:   
# pay_each_person -   Float: dollar amount each person should pay
#
# State Changes:
# None?
  def pay_each_person
    pay_each_person = ((amt * (1 + perc_tip)) / num_attendees).round(2)
  end 
end
#--------------------------------------------------
#binding.pry