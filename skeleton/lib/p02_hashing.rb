class Fixnum
end

class Array
  def hash
    str = ""
    self.each do |el|
      str += el.hash.abs.to_s
    end
    str.to_i
  end
end

class String
  def hash
    result = self.chars.map {|char| char.ord}
    result.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual hash#hash method
  def hash
    result = ""
    arr = self.sort_by {|k,v| k}
    arr.each do |el|
      result += el[0].object_id.to_s
      result += el[1].hash.to_s
    end
    result.to_i
  end
end
