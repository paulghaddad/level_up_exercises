require_relative 'dinosaur'
require_relative 'filters'

module DinosaurCatalog
  class Catalog
    include Filters

    attr_reader :dinosaurs

    def initialize(csv_object=nil)
      #@path = path
      @dinosaurs = []
      build_catalog_entries(csv_object) unless csv_object.nil?
    end

    def build_catalog_entries(csv_file)
      CSV.parse(csv_file, headers: true, header_converters: :symbol).each do |data|
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
end
