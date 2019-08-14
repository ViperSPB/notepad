require_relative 'post'
require_relative 'link'
require_relative 'memo'
require_relative 'task'
require "R:/Lessons.SDE/RubyRush/settings.rb"



choices = Post.post_types
choice = -1
# показываем меню выбора типа записи
until choice >= 0 && choice < choices.size do
  cls
  puts "Привет, смертный, выбери какую запись хочешь сделать!"
  choices.each_with_index do |item, index|
    puts " #{index}: #{item}"
  end
  choice = STDIN.gets.to_i
end

vibor = Post.create(choice)
vibor.read_from_console
vibor.save

puts "\nЗапись сделана, работа завершена, пакеда, бабанька!.."
