require 'pry'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector/inflections'
require_relative 'display'
require_relative 'json_export'
require_relative 'option_parser'
require_relative 'build_csv'
require_relative 'csv_modifier'
require_relative 'user_prompts'
require_relative 'user_processing'

class App
  include BuildCsv
  include CsvModifier
  include Filters
  include Display
  include JsonExport
  include UserProcessing

  def initialize(name)
    @app_name = name
  end

  def launch!(csv_filename=nil)
    @csv_filename = csv_filename
    normalize_csv_file(csv_filename)
    @catalog = create_catalog("normalized_csv_file.csv")
    obtain_user_filters
  end

  def create_catalog(filepath)
    @catalog = Catalog.new(filepath)
  end

  def filter_results(catalog, filters)
    filtered_dinosaur_listings = catalog.dinosaurs
    filters.each do |search_type, criteria|
      filter_function = "filter_#{search_type}".to_sym
      filtered_dinosaur_listings = Catalog.from_array(filtered_dinosaur_listings).send(filter_function, criteria)
    end
    filtered_dinosaur_listings
  end

  def print_search_summary(search_results)
    puts "\n"
    search_results.each { |dinosaur| puts "#{dinosaur.name}"}
    puts "\n"
  end
end
