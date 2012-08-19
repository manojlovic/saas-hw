class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)  
    pp method_id
    #pp args
    pp self
    singular_currency = method_id.to_s.gsub( /s$/, '')
    pp singular_currency
    if @@currencies.has_key?(singular_currency)
      pp @@currencies[singular_currency]
      self * @@currencies[singular_currency]
    else
      pp "2"
      self
    end
  end
  def in(method_id)
    #pp method_id
    #pp self
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      self
    end
  end
end

require "pp"

#pp 10.rupees.in(:euro)

#pp 10.euros.in(:rupees)

#pp 5.dollars.in(:euros)

#pp 2.rupee.in(:dollar)

#b
class String
  def method_missing(method_id, *args)
    #pp method_id
    #pp self
    if(method_id.to_s == "palindrome?")
      self.gsub(/[\W]/, '').downcase.reverse == self.gsub(/[\W]/, '').downcase
    else
      super
    end
  end
end

#test
def palindrome?(string)
  string.gsub(/[\W]/, '').downcase.reverse == string.gsub(/[\W]/, '').downcase
end

#pp "foo".palindrome?
#pp "oofoo".palindrome?

#c
module Enumerable
  def method_missing(method_id, *args)
    if(method_id.to_s == "palindrome?")
      string = self.flat_map { |i| i.to_s }.join #TODO treba ovde doraditi
      string.gsub(/[\W]/, '').downcase.reverse == string.gsub(/[\W]/, '').downcase
    end
  end
end


pp (1..2).palindrome? #false
pp [1,2,3,2,1].palindrome? # => true
pp ["a", "b", "c", "b", "a"].palindrome? #1 true
#pp { "hello"=>"world" }.palindrome? # => false
