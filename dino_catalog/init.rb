require_relative 'lib/catalog'
require_relative 'lib/app'

app = App.new("dinosaur_catalog")

if ARGV.size == 1
  csv_file = ARGV.shift

  app.launch!(csv_file)
else
  puts "\nPlease enter the filename of the CSV to import\n\n"
  puts "Enter 'quit' or 'exit' to leave the program.\n\n"
  print ">>  "
  user_file = gets.chomp
  if user_file == 'quit' || user_file == 'exit'
    puts "\n\nExiting.\n\n"
    exit!
  else
    puts "\nFile Found!\n"
    app.launch!(user_file)
  end
end
