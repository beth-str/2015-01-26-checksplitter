#header for all test

require 'minitest/autorun'
require_relative 'checksplitter-dinnerclub'

class CheckSplitterTest < Minitest::Test
  
  # def test_   #always start with test_
  #   assert true
  # end
  ### Put tests here

  def test_simple_input_with_expected_integer_output
    cs = CheckSplitter.new(6, 100, 20) #(num_attendees, amt, tip)
    assert_equal(20, cs.pay_each_person) #(expected_value, actual_value)
  end  
end