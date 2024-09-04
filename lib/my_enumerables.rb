module Enumerable
  def my_each_with_index
    i = 0

    self.my_each do |element|
      yield(element, i) if block_given?
      i += 1
    end
    self
  end

  def my_select
    selected_elements = []

      self.my_each do |element|
        selected_elements << element if yield(element)
      end
      selected_elements
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    i = 0

    self.my_each do |element|
      if block_given?
        i += 1 if yield(element)
      else
        i += 1
      end
    end
    i
  end

  def my_map
    changed_elements = []
    self.my_each do |element|
      changed_elements << yield(element)
    end
    changed_elements
  end

  def my_inject(initial = nil)
    accumulator = initial

    self.each do |element|
      if accumulator.nil?
        accumulator = element
      else
        accumulator = yield(accumulator, element)
      end
    end
    accumulator
  end
end

class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i]) if block_given?
      i += 1
    end
    self
  end
end
