# encoding: utf-8
require_relative "lib/item_of_clothing"
require_relative "lib/wardrobe"

# Этот код необходим только при использовании русских букв на Windows.
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

questions = ["Укажите название вещи, например: шарф, футболка и т.д",
             "Укажите тип вещи, например: обувь, головной убор и т.д",
             "Укажите диапазон температур для этой вещи, например: (-5, 25)"]

current_path = File.dirname(__FILE__) + '/data'

puts "\nДобро пожаловать в 'Гардероб' !"
puts "\nМы поможем вам одеться стильно и по погоде!"

puts "\nСколько градусов за окном? (можно с минусом)"
temperature = STDIN.gets.to_i

puts "Хотите добавить в наш гардероб свою одежду ? 1.Да 2.Нет"
user_input = STDIN.gets.to_i

def create_new_item_file(current_path)
  time = Time.now
  file_name = time.strftime("%Y-%m-%d_%Hh%Mm%Ss") + ".txt"

  file = File.new(current_path + "/" + file_name, "a:UTF-8")
end

while user_input == 1
  file = create_new_item_file(current_path)

  questions.each do |question|
    puts question
    line = STDIN.gets.to_s.capitalize
    file.puts(line)
  end

  file.close

  puts "Еще одну вещь? 1.Да  2.Нет"
  user_input = STDIN.gets.to_i
end

all_items = []

Dir.glob(current_path + "/*.txt") do |txt_file|
  item_of_clothes = ItemOfClothing.new(txt_file, temperature)

  all_items << item_of_clothes
end

wardrobe = Wardrobe.new(all_items)

puts "Предлагаем сегодня надеть:"
# wardrobe.clothes_to_suggest.each {|k,v| puts  v}

puts wardrobe.clothes_to_suggest