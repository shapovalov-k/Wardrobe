class ItemOfClothing
  attr_reader :name, :type, :temperature_range, :file, :temperature

  def initialize(file_path, temperature)
    @file = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    @temperature = temperature

    @name = file[0]
    @type = file[1]
    @temperature_range = string_to_range
  end


  # У экземпляра класса Вещь разумно сделать метод: подходит_под_погоду?

  def appropriate_for_the_weather?
    @temperature_range.include?(temperature)
  end

  #Convert a string to a range object
  def string_to_range
    my_temp_range = file[2].gsub(/[\(\)]/, "").split(", ")
    my_temp_range.map! {|element| element.to_i}

    my_temp_range[0]..my_temp_range[1]
  end

  def to_s
    "#{@name} (#{@type}) #{@temperature_range}"
  end
end