require 'pry'
class Triangle
  # write code here
  attr_accessor :l1, :l2, :l3

  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def kind
    validate_triangle
    
    if @l1 == @l2 && @l1 == @l3
      :equilateral
    
    elsif @l1 == @l2 || @l1 == @l3 || @l2 == @l3
      :isosceles
    elsif @l1 != @l2 && @l1 != @l3 && @l2 != @l3
      :scalene
    end
  end

  def side_larger_than_zero?
    @l1 > 0 && @l2 > 0 && @l3 > 0
  end

  def sum_of_two_sides?
    @l1 + @l2 > @l3 && @l1 + @l3 > @l2 && @l3 + @l2 > @l1
  end

  # validate triangle 
  def validate_triangle
    raise TriangleError if !side_larger_than_zero? || !sum_of_two_sides?
  end

  class TriangleError < StandardError
    def message
      "You must provide a valid triangle."
    end
  end
end

binding.pry

