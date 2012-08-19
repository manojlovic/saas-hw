class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{def #{attr_name}=(val)
              if @#{attr_name}    
                @#{attr_name}_history << val
              else
                @#{attr_name}_history = [nil]
                @#{attr_name}_history << val
              end
              @#{attr_name} = val
              end }
           
         #"your code here, use %Q for multiline strings"
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar = 2
print f.bar_history # => if your code works, should be [nil,1,2]
print "\n"