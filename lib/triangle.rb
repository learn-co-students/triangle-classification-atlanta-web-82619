class Triangle
  attr_reader :side1, :side2, :side3
  def initialize (side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if (side1 <= 0) or (side2 <= 0) or (side3 <= 0)
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.invalid_side_message
      end

    elsif (side1 + side2 <= side3) or (side2 + side3 <= side1) or (side1 + side3 <= side2)
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.triangle_inequality_failed_message
      end

    else 
      if (side1 == side2) and (side2 == side3)
        :equilateral
      elsif (side1 == side2) or (side2 == side3) or (side1 == side3)
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError
    def invalid_side_message
      'Triangle invalid: all sides must have positive length'
    end

    def triangle_inequality_failed_message
      'Triangle inavlid: triangle inequality fails for these lengths'
    end
  end
end
