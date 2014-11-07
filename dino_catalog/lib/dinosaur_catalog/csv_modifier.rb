require 'csv'

module DinosaurCatalog
  module CsvModifier
    NORMALIZED_CSV_FILENAME = "normalized_csv_file.csv"

    ALIAS_TABLE = {
      'Genus' => 'Name',
      'Carnivore' => 'Diet',
      'Weight' => 'Weight_in_lbs',
    }

    def normalize_csv_file(filename)
      new_header_names = replace_header_with_alias(filename)
      normalize_csv_body(filename, new_header_names)
    end

    def normalize_csv_body(old_csv_file, header_row)
      new_headers = replace_header_with_alias(old_csv_file)
      #CSV.open(NORMALIZED_CSV_FILENAME, 'w') do |csv|
      new_csv_file = CSV.generate do |csv|
        csv << header_row
        CSV.read(old_csv_file, headers: true).each do |row|
          row['Carnivore'] = 'Carnivore' if row['Carnivore'] == 'Yes'
          row['Carnivore'] = 'No' if row['Carnivore'] == 'No'
          csv.puts row
        end
      end
      new_csv_file
    end

    def replace_header_with_alias(csv_file)
      header_row = CSV.read(csv_file, headers: true).headers
      build_table_body(header_row)
    end

    def build_table_body(header)
      header.inject([]) do |new_header, column_name|
        if ALIAS_TABLE[column_name]
          new_header << ALIAS_TABLE[column_name]
        else
          new_header << column_name
        end
      end
    end
  end
end
