class Dinosaur

  attr_reader :name, :period, :continent, :diet, :weight_in_lbs, :walking, :description

  def initialize(name, options = {})
    @name = name
    @period = options[:period]
    @continent = options[:continent]
    @diet = options[:diet]
    @weight_in_lbs = options[:weight_in_lbs]
    @walking = options[:walking]
    @description = options[:description]
  end

  def big?
    @weight_in_lbs.to_i / 2000 > 2
  end

end


#options.each { |key, value| insnce_variable_set("@#{key}", value)}
