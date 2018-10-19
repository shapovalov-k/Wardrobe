class ItemOfClothing
  attr_reader :file, :type, :temperature

  def initialize(file_path, temperature)
    @file = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    @temperature = temperature

    @name = file[0]
    @type = file[1]
    @temperature_range = string_to_range
  end

  def appropriate_for_the_weather?
    @temperature_range.include?(temperature)
  end

  #Convert a string to a range object
  def string_to_range
    my_temp_range = file[2].delete("(" ")").split(", ")
    my_temp_range.map! {|element| element.to_i}

    my_temp_range[0]..my_temp_range[1]
  end

  def to_s
     "#{@name} (#{@type}) #{@temperature_range}"
  end
end