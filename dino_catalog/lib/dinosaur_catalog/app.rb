require 'pry'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector/inflections'
require_relative 'display'
require_relative 'json_export'
require_relative 'csv_modifier'
require_relative 'user_prompts'
require_relative 'user_processing'

module DinosaurCatalog
  class App
    include CsvModifier
    include Filters
    include Display
    include JsonExport
    include UserProcessing

    EXIT_TERMS = ['quit', 'exit']

    def initialize(name)
      @app_name = name
    end

    def create_app(file)
      if EXIT_TERMS.include?(file)
        puts "\n\nExiting.\n\n"
        exit!
      else
        puts "\nFile Found!\n"
        launch_app!(file)
      end
    end

    def launch_app!(csv_filename=nil)
      @csv_filename = csv_filename
      new_csv_file = normalize_csv_file(csv_filename)
      @catalog = create_catalog(new_csv_file)
      obtain_user_filters
    end

    def create_catalog(filepath)
      @catalog = Catalog.new(filepath)
    end

    def perform_search(input)
      exit! if EXIT_TERMS.include? input
      search_terms = get_user_search_terms(input)
      search_dinosaurs(search_terms)
    end

    def search_dinosaurs(terms)
      @filtered_dinosaurs = nil
      @filtered_dinosaurs = filter_dinosaur_results(@catalog, terms)
      puts "\nYour search resulted in #{@filtered_dinosaurs.size} dinosaurs:"
      print_search_summary(@filtered_dinosaurs)
      user_processing
    end

    def filter_dinosaur_results(catalog, filters)
      filtered_dinosaur_listings = catalog.dinosaurs
      filters.each do |search_type, criteria|
        filter_function = "filter_#{search_type}".to_sym
        filtered_dinosaur_listings = Catalog.from_array(filtered_dinosaur_listings).send(filter_function, criteria)
      end
      filtered_dinosaur_listings
    end

    def print_search_summary(search_results)
      puts "\n"
      search_results.each { |dinosaur| puts "#{dinosaur.name}" }
      puts "\n"
    end
  end
end
