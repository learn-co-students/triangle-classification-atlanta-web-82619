class Triangle

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    triangle_helper
    if a == b && a == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def triangle_helper
    valid = [(a + b > c), (a + c > b), (b + c > a)]
      [a, b, c].each do |side|
        valid << false if side <= 0
        raise TriangleError if valid.include?(false)
      end
  end


  class TriangleError < StandardError

  end
end
