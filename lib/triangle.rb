class Triangle
  def initialize(length, width, height)
    @length = length
    @width = width
    @height = height
  end

  def kind
    validate_triangle

    if @length == @width && @width == @height
      :equilateral
    elsif @length == @width || @width == @height || @length == @height
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_dimensions
    validate_triangle_inequality
  end

  def validate_positive_dimensions
    if @length <= 0 || @width <= 0 || @height <= 0
      raise TriangleError, "dimensions must be larger than 0"
    end
  end

  def validate_triangle_inequality
    if @length + @width <= @height || @width + @height <= @length || @length + @height <= @width
      raise TriangleError, "violates triangle inequality"
    end
  end

  class TriangleError < StandardError
  end
end
