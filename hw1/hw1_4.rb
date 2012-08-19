class Dessert
  
  def name
    @name
  end
  def calories
    @calories
  end
  
  def name=(_name)
    @name = _name
  end
  def calories=(_calories)
    @calories = _calories
  end
  
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def healthy?
    if @calories < 200
      true
    else
      false
    end
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  
  def flavor
    @flavor
  end
  def flavor=(_flavor)
    @flavor = _flavor
  end
  
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  
  def delicious?
    return false unless @flavor.casecmp("black licorice") != 0
    return true
  end
end