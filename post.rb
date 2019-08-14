# Базовый класс "Запись"
# Задает основные методы и свойства, присущие всем разновидностям Записи
class Post

  def self.post_types
    [Memo, Link, Task]
  end

  def self.create(type_index)
    return post_types[type_index].new
  end

  # Конструктор
  def initialize
    @created_at = Time.now # дата создания записи
    @text = nil # массив строк записи — пока пустой
  end

  # Этот метод вызывается в программе, когда нужно
  # считать ввод пользователя и записать его в нужные поля объекта
  def read_from_console
    # должен быть реализован классами-детьми,
    # которые знают как именно считывать свои данные из консоли
  end

  # Этот метод возвращает состояние объекта в виде массива строк, готовых к записи в файл
  def to_strings
    # должен быть реализован классами-детьми,
    # которые знают как именно хранить себя в файле
  end

  # Этот метод записывает в файл сформированный массив значений
  def save
    file = File.new(file_path, "w:UTF-8")
    to_strings.each { |string| file.puts(string) }
    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__ )
    # странно, строка ниже форматированная кроме как так _%H-%M-%S
    # не дает создавать файл/ так например не получается = %H:%M:%S
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S")
    return current_path + "/" + file_name + ".txt"
  end
  
end