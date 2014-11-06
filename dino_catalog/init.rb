require_relative 'lib/catalog'
require_relative 'lib/app'

app = App.new("dinosaur_catalog")

EXIT_TERMS = ['quit', 'exit']

USER_FILE_IMPORT = %Q%\nPlease enter the filename of the CSV to import\n\n\
Enter 'quit' or 'exit' to leave the program.\n\n>> %

if ARGV.size == 1
  csv_file = ARGV.shift
  app.launch!(csv_file)
else
  print USER_FILE_IMPORT
  user_file = gets.chomp
  launch_app(user_file)
end

def launch_app(user_input)
  if EXIT_TERMS.include? user_file
    puts "\n\nExiting.\n\n"
    exit!
  else
    puts "\nFile Found!\n"
    app.launch!(user_file)
  end
end
