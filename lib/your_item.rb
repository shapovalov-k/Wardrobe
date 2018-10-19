module YourItem
  def self.creates(user_input, current_path)
    questions = ["Укажите название вещи, например: шарф, футболка и т.д",
                 "Укажите тип вещи, например: обувь, головной убор и т.д",
                 "Укажите диапазон температур для этой вещи, например: (-5, 25)"
    ]

    while user_input == 1
      time = Time.now
      file_name = time.strftime("%Y-%m-%d_%Hh%Mm%Ss") + ".txt"

      file = File.new(current_path + "/" + file_name, "a:UTF-8")

      questions.each do |question|
        puts question
        line = STDIN.gets.to_s.capitalize
        file.puts(line)
      end

      file.close

      puts "Еще одну вещь? 1.Да  2.Нет"
      user_input = STDIN.gets.to_i
    end
  end
end