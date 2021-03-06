require 'dinosaur'
require 'filters'

class Catalog
  include Filters

  attr_reader :dinosaurs

  def initialize(path=nil)
    @path = path
    @dinosaurs = []
    build_catalog_entries unless path.nil?
  end

  def build_catalog_entries
    CSV.read(@path, headers: true, header_converters: :symbol).each do |data|
      @dinosaurs << create_dinosaur_entry(data[:name], data)
    end
  end

  def create_dinosaur_entry(name, attributes)
    Dinosaur.new(name, attributes)
  end

  def self.from_array(array)
    catalog = Catalog.new
    catalog.instance_variable_set(:@dinosaurs, array)
    catalog
  end

end
