class Wardrobe
  attr_reader :wardrobe

  def initialize(all_items)
    @wardrobe = all_items
  end

  # Этот метод возвращает массив с уникальными типами одежды
  def types_of_items
    wardrobe.map {|item| item.type}.uniq
  end

  # Этот метод возвращает Hash с вещами одного типа
  def items_of_the_same_type
    Hash[types_of_items.map {|type| [type, wardrobe.select {|item| item.type == type}]}]
  end

  # В зависимости от указанной пользователем температуры предлагаем вещи
  def clothes_to_suggest
    items_of_the_same_type.each_value do |value|
      puts value.select {|item| item.appropriate_for_the_weather?}.sample
    end
  end
end
