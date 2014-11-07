module DinosaurCatalog
  module JsonExport
    def convert_to_json(ruby_object)
      array_of_objects = convert_object_to_array(ruby_object)
      File.open("json_export.json", "w") { |f| f.puts JSON.generate(array_of_objects) }
    end

    def convert_object_to_array(object)
      object.inject([]) { |array, attribute| array << attribute.to_hash }
    end
  end
end
