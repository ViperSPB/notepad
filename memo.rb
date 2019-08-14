class Memo < Post

  # метод записывает в массив то, что введет юзер до момента ввода строки end
  def read_from_console
    puts "Делаем простую запись"
    puts "Введи необходимый текст. Окончание ввода - строка end"
    @text = []
    string = nil
    while string != "end" do
      string = STDIN.gets.chomp
      @text << string
    end
    @text.pop
  end

  # возвращает массив строк для записи в файл
  def to_strings
    create_time = "Запись создана: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}"
    return @text.unshift(create_time)
  end
end