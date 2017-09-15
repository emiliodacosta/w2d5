class Fixnum
  # Fixnum#hash already implemented for you
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
  # Make sure to implement an actual Hash#hash method
  def hash
    result = ""
    p self
    arr = self.sort_by {|k,v| k}
    p self
    p arr
    arr.each do |el|
      result += el[0].object_id.to_s
      result += el[1].hash.to_s if el[1].is_a?(Integer)
      result += el[1].hash.to_s if el[1].is_a?(String)
    end
    result
  end
end