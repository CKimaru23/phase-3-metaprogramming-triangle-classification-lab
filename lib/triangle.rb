class TriangleError < StandardError
end

class Triangle
  def initialize(a, b, c)
    raise TriangleError, "Sides of a triangle cannot have negative or zero length" if a <= 0 || b <= 0 || c <= 0
    raise TriangleError, "Triangle inequality is violated" if (a + b <= c) || (a + c <= b) || (b + c <= a)
    @a, @b, @c = a, b, c
  end

  def kind
    if @a == @b && @b == @c
      :equilateral
    elsif @a == @b || @a == @c || @b == @c
      :isosceles
    else
      :scalene
    end
  end
end

begin
  triangle = Triangle.new(3, 3, 3)
  puts triangle.kind # returns: equilateral
  
  triangle = Triangle.new(2, 2, 3)
  puts triangle.kind # returns: isosceles
  
  triangle = Triangle.new(3, 4, 5)
  puts triangle.kind # returns: scalene
rescue TriangleError => e
  puts e.message
end
