# encoding: utf-8
require "./lib/item_of_clothing.rb"
require "./lib/wardrobe.rb"
require "./lib/your_item.rb"

# Этот код необходим только при использовании русских букв на Windows.
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__) + '/data'

puts "\nДобро пожаловать в 'Гардероб' !"
puts "\nМы поможем вам одеться стильно и по погоде!"

puts "\nСколько градусов за окном? (можно с минусом)"
temperature = STDIN.gets.to_i

puts "Хотите добавить в наш гардероб свою одежду ? 1.Да 2.Нет"
user_input = STDIN.gets.to_i

YourItem.creates(user_input, current_path)

all_items = []

Dir.glob(current_path + "/*.txt") do |txt_file|
  item_of_clothes = ItemOfClothing.new(txt_file, temperature)

  all_items << item_of_clothes
end

wardrobe = Wardrobe.new(all_items)

puts "Предлагаем сегодня надеть:"
wardrobe.clothes_to_suggest
