# 2015-01-28 (Day 3)
# CheckSplitter w/ Dinner Club, Event Tracking, and "Treat"
# Does not track who attended which event. Does not account for treater.

require 'pry'

#------------------------------------------------
class DinnerClub
  attr_accessor :event_list, :members, :attendees, :date, :restaurant
  def initialize(*name)
    @total_pay = 0.0
    @event_list = Array.new
    @members = Hash.new
    name.each {|member| @members[member] = 0.0} #hash to track payments
  end

  def add_member(name)
    @members[name] = 0.0
  end

  def create_new_event(date, restaurant, *attendees)
    @restaurant = restaurant
    @date = date
    # @event_list << [date, restaurant, amount]
    @attendees = Array.new   #array to determine # of attendees
    attendees.each {|attendee| @attendees.push(attendee)}
    puts @attendees
  end  
  
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
class CheckSplitter
  attr_accessor :num_attendees, :amt, :perc_tip 
  def initialize(num_attendees, amt, perc_tip)
    @num_attendees = num_attendees
    @amt = amt
    @perc_tip = perc_tip * 0.01
  end   
  # def total_cost
  #   @total_cost = ((amt * perc_tip) + amt)
  # end
  def pay_each_person
    pay_each_person = ((amt * (1 + perc_tip)) / num_attendees).round(2)
  end 
end
#--------------------------------------------------
binding.pry
