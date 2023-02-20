class Triangle
  attr_accessor :l1, :l2, :l3
  
  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def kind
    if (self.valid?)
      self.type
    else
      raise TriangleError
    end
  end

  def valid?
    sum1 = self.l1 + self.l2
    sum2 = self.l1 + self.l3
    sum3 = self.l2 + self.l3
    if (self.l1 <= 0 || self.l2 <= 0 || self.l3 <= 0)
      false
    elsif (sum1 <= self.l3 || sum2 <= self.l2 || sum3 <= self.l1)
      false
    else
      true
    end
  end

  def type
    if (self.l1 == self.l2 && self.l1 == self.l3)
      :equilateral
    elsif (self.l1 == self.l2 || self.l1 == self.l3 || self.l2 == self.l3)
      :isosceles
    else 
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "This is not a valid triangle"
    end
  end
end