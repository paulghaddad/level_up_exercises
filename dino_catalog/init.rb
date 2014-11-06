require_relative 'lib/catalog'
require_relative 'lib/app'

app = App.new("dinosaur_catalog")

EXIT_TERMS = ['quit', 'exit']

if ARGV.size == 1
  csv_file = ARGV.shift
  app.launch!(csv_file)
else
  puts "\nPlease enter the filename of the CSV to import\n\n"
  puts "Enter 'quit' or 'exit' to leave the program.\n\n"
  print ">>  "
  user_file = gets.chomp
  if EXIT_TERMS.include? user_file
    puts "\n\nExiting.\n\n"
    exit!
  else
    puts "\nFile Found!\n"
    app.launch!(user_file)
  end
end
