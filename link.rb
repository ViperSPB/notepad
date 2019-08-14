class Link < Post

  def initialize
    super # вызываем конструктор родителя
    # потом инициализируем специфичное для ссылки поле
    @url = ''
  end

  def read_from_console
    puts "Вводим полезную ссылку"
    puts "Введи ссылку, которую хочешь сохранить"
    @url = STDIN.gets.chomp

    puts "Введи комментарий, что находится по ссылке"
    @text = STDIN.gets.chomp
  end

  # возвращает массив строк для записи в файл
  def to_strings
    create_time = @created_at.strftime("Запись создана:_%Y-%m-%d,_%H:%M:%S")
    return [create_time, @url, @text]
  end
end