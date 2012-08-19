#a
class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      self
    end
  end
  def in(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      self
    end
  end
end

#b
class String
  def method_missing(method_id, *args)
    if(method_id.to_s == "palindrome?")
      self.gsub(/[\W]/, '').downcase.reverse == self.gsub(/[\W]/, '').downcase
    else
      super
    end
  end
end

#c
module Enumerable
  def method_missing(method_id, *args)
    if(method_id.to_s == "palindrome?")
      string = self.flat_map { |i| i.to_s }.join
      string.gsub(/[\W]/, '').downcase.reverse == string.gsub(/[\W]/, '').downcase
    end
  end
end