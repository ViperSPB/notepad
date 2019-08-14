require 'date'

class Task < Post

  def initialize
    super # вызываем конструктор родителя
    # потом инициализируем специфичное для ссылки поле
    @due_date = Time.now
  end

  def read_from_console
    puts "Вводим задачу для выполнения"
    puts "Введи что собираешься делать"
    @text = STDIN.gets.chomp

    puts "Введи дату, до которой надо выполнить задачу.
Ввод даты делаем по формату ДД.ММ.ГГГГ, например 22.01.1999"
    dedline = STDIN.gets.chomp
    @due_date = Date.parse(dedline)
  end

  # возвращает массив строк для записи в файл
  def to_strings
    create_time = @created_at.strftime("Запись создана:_%Y-%m-%d,_%H:%M:%S")
    dedline = "Крайний срок исполнения: #{@due_date}"
    return [create_time, dedline, @text]
  end
end