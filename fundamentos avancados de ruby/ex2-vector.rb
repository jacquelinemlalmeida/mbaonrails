class Vector2
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def *(other_class)
    case other_class
    when Numeric
      Vector2.new(@x * other_class, @y * other_class)
    when Vector2
      @x * other_class.x + @y * other_class.y
    else
      raise ArgumentError, "Multiplicação não suportada para #{other_class.class}"
    end
  end

  def coerce(other_class)
    if other_class.is_a?(Numeric)
      [self, other_class]
    else
      raise TypeError, "Não é possível multiplicar Vector2 com #{other_class}"
    end
  end

  # sobreescrita da chamada do puts em caso de ser do tipo Vector2
  def to_s
    "(#{@x}, #{@y})"
  end
end

# Testes

v = Vector2.new(3, 4)

puts v * 2
puts v * 2.5
puts v * v
puts 2 * v
puts 2.5 * v
