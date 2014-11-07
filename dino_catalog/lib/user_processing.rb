module UserProcessing
  SEARCH_REGEX = {
    bipeds: /biped/,
    carnivores: /carnivore|insectivore|piscivore/,
    periods: /cretaceous|permian|jurassic|oxfordian|albian|triassic/,
    sizes: /big|small/,
  }

  EXIT_TERMS = ['quit', 'exit']

  def obtain_user_filters
    print UserPrompts::USER_SEARCH_PROMPT
    print '> '
    user_input = gets.chomp.downcase
    puts
    perform_search(user_input)
  end

  def get_user_search_terms(phrase)
    search_terms = {}
    SEARCH_REGEX.each do |term, regex|
      search_terms[term] = phrase.scan(regex) unless phrase.scan(regex).empty? #  use inject?
    end
    search_terms
  end

  def user_processing
    print UserPrompts::USER_PROCESSING_PROMPT
    print '> '
    user_input = gets.chomp.downcase
    user_actions(user_input)
  end

  def user_actions(user_input)
    exit! if EXIT_TERMS.include? user_input
    return print_results if user_input == 'print'
    return new_search if user_input == 'search'
    return json if user_input == 'json'
    return search_dinosaur(user_input)
  end

  def print_results
    print_dinosaur_set(@filtered_dinosaurs)
    user_processing
  end

  def new_search
    launch_app!(@csv_filename)
  end

  def json
    convert_to_json(@filtered_dinosaurs)
    puts "\nYour JSON file has been saved as json_export.json in the main directory."
    user_processing
  end

  def search_dinosaur(input)
    print_dinosaur_instance(@filtered_dinosaurs, input)
    user_processing
  end
end
