# Killer facts about triangles AWW YEAH
class Triangle
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    @angles = triangle_angles(@side_1, @side_2, @side_3)
  end

  def triangle_angles(*sides)
    [angle_1(*sides), angle_2(*sides), angle_3(*sides)]
  end

  def angle_1(*sides)
    numerator = @side_2**2 + @side_3**2 - @side_1**2
    denominator = 2.0 * @side_2 * @side_3
    radians_to_degrees(Math.acos(numerator / denominator))
  end

  def angle_2(*sides)
    numerator = @side_1**2 + @side_3**2 - @side_2**2
    denominator = 2.0 * @side_1 * @side_3
    radians_to_degrees(Math.acos(numerator / denominator))
  end

  def angle_3(*sides)
    numerator = @side_1**2 + @side_2**2 - @side_3**2
    denominator = 2.0 * @side_1 * @side_2
    radians_to_degrees(Math.acos(numerator / denominator))
  end

  def radians_to_degrees(radians)
    (radians * 180 / Math::PI).round
  end

  def equilateral?
    @angles.uniq.length == 1
  end

  def isosceles?
    @angles.uniq.length == 2
  end

  def scalene?
    @angles.uniq.length == 3
  end

  def right?
    @angles.include?(90)
  end

  def recite_facts
    puts print_triangle_type
    puts "The angles of this triangle are: #{@angles.join(', ')}"
    puts "This triangle is also a right triangle!" if right?
    puts
  end

  def print_triangle_type
    if equilateral?
      "This triangle is equilateral!"
    elsif isosceles?
      "This triangle is isosceles! Also, that word is hard to type."
    else
      "This triangle is scalene and mathematically boring."
    end
  end
end

triangles = [
  [5, 5, 5],
  [5, 12, 13],
]

triangles.each do |triangle|
  tri = Triangle.new(*triangle)
  tri.recite_facts
end
