if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'json'

current_path = File.dirname(__FILE__ )
file_path = current_path + "/mendeleev.json"

file = File.read(file_path, encoding: "UTF-8")


table = JSON.parse(file)

puts "Ми маємо #{table.keys.size} елементів"
puts

puts table.keys.join(', ')
puts

puts "Про який елемент хочете дізнатися?"

elements = STDIN.gets.chomp

if table.key?(elements)
  element = table[elements]
   puts
   puts "Порядковий номер: #{element['number']}"
   puts
   puts "Назва: #{table[elements]['name']}"
   puts
   puts "Назва на латині: #{table[elements]['latin']}"
   puts
   puts "Періодична група: #{element['period_group']}"
   puts
   puts "Атомна маса: #{table[elements]['atomic_mass']}"
   puts
   puts "Щильність речовини: #{element['density']}"
   puts
   puts "Температура плавлення: #{table[elements]['melt_temp']}"
   puts
   puts "Температура кипіння: #{element['freeze_temp']}"
   puts
   puts "Рік відкриття: #{table[elements]['year']}"
   puts
   puts "Першовідкривач: #{element['discoverer']}"
   puts
   puts "Вимова назви елемента: #{table[elements]['pronunciation']}"
  # table[elements].each_value {|value| puts "#{value}"}
else
  puts "У нашій базі даних не має токого елемента :("
end