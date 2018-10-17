class Clothes
  attr_reader :name, :type, :temperature_range, :temperature, :array

  def initialize(file_path, temperature)
    @file_path = file_path
    @array = File.readlines(file_path)

    @temperature = temperature

    @name = array[0]
    @type = array[1]
    @temperature_range = string_to_range
  end


  # У экземпляра класса Вещь разумно сделать метод: подходит_под_погоду?

  def appropriate_for_the_weather?
    @temperature_range.include?(temperature)
  end


  #Convert a string to a range object
  def string_to_range
    my_temp_range = array[2].gsub(/[\(\)]/, "").split(", ")
    my_temp_range.map! {|element| element.to_s}

    my_temp_range[0]..my_temp_range[1]
  end
end