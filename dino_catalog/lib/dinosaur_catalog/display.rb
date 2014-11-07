module DinosaurCatalog
  module Display
    PADDING = 20

    HEADER_NAMES = ["Name", "Period", "Continent", "Diet", "Weight (lbs)", "Walking", "Description"]

    def print_dinosaur_set(set)
      print_summary_header
      set.each do |entry|
        print_attribute(entry.name, PADDING)
        print_attribute(entry.period, PADDING)
        print_attribute(entry.continent, PADDING)
        print_attribute(entry.diet, PADDING)
        print_attribute(entry.weight_in_lbs, PADDING)
        print_attribute(entry.walking, PADDING)
        print_attribute(entry.description, PADDING)
        puts
      end
    end

    def print_dinosaur_instance(set, name)
      entry = set.detect { |dinosaur| dinosaur.name.downcase =~ /#{name}/ }
      if entry
        puts "\nBelow is information on the dinosaur you entered:\n\n"
        print "Name".center(PADDING) if entry.name
        print "Period".center(PADDING) if entry.period
        print "Continent".center(PADDING) if entry.continent
        print "Diet".center(PADDING) if entry.diet
        print "Weight (lbs)".center(PADDING) if entry.weight_in_lbs
        print "Walking".center(PADDING) if entry.walking
        print "Description".center(PADDING) if entry.description
        puts ''
        print_attribute(entry.name, PADDING) if entry.name
        print_attribute(entry.period, PADDING) if entry.period
        print_attribute(entry.continent, PADDING) if entry.continent
        print_attribute(entry.diet, PADDING) if entry.diet
        print_attribute(entry.weight_in_lbs, PADDING) if entry.weight_in_lbs
        print_attribute(entry.walking, PADDING) if entry.walking
        print_attribute(entry.description, PADDING) if entry.description
        puts
      else
        puts "\nSorry, but I did not recognize that dinosaur name.\n"
      end
    end

    def print_attribute(attribute, padding)
      if attribute
        print attribute.center(padding)
      else
        print "---".center(padding)
      end
    end

    def print_summary_header
      puts "\n\n"
      HEADER_NAMES.each { |header| print header.center(PADDING) }
      puts ''
    end
  end
end
