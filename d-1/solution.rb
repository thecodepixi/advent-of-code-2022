class CalorieCounter
  def initialize(data)
    @data = data
    data_to_i
  end

  def data_to_i
    @data = @data.map{ |d| d.map{ |n| n.to_i } }
  end
    
  def sort_descending
    @data.map{ |d| array_total(d) }.sort.reverse
  end

  def most_calories
    return sort_descending.first
  end

  def top_three_total
    return array_total(sort_descending.slice(0..2))
  end

  private 

  def array_total(array)
    return array.reduce(0){ |s, n| s + n }
  end
end

class InputProcessor
  class << self
    def parse(file)
      file = File.open(file)
      content = file.readlines(sep = "\n\n", chomp: true).map { |val| val.split("\n") }
      file.close 
      content
    end 
  end 
end 

counter = CalorieCounter.new(InputProcessor.parse('./d-1_input.txt'))
# solution 1
puts counter.most_calories
# solution 2
puts counter.top_three_total
