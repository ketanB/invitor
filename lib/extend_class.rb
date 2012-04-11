class String
  def zerofy
    self.to_i < 10 ? "0#{self}" : self
  end
end

class Number
  def zerofy
    self < 10 ? "0#{self}" : self
  end
end

class Array
  def add_condition! (condition, conjunction = 'AND')
    if String === condition
      add_condition!([condition])
    elsif Hash === condition
      add_condition!([condition.keys.map { |attr| "#{attr}=?" }.join(' AND ')] + condition.values)
    elsif Array === condition
      self[0] = "(#{self[0]}) #{conjunction} (#{condition.shift})" unless empty?
      (self << condition).flatten!

    else
      raise "don't know how to handle this condition type"
    end
    self
  end
end