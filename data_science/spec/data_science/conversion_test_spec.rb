require 'data_science/conversion_test'
require 'data_science/json_parser'
require 'data_science/view_helpers'

module DataScience
  describe ConversionTest do
    let(:conversion_test) { ConversionTest.new }
    let(:parsed_json_data) do
    [
      { "date" => "2014-03-20", "cohort" => "A", "result" => 1 },
      { "date" => "2014-03-20", "cohort" => "B", "result" => 1 }
    ]
    end

    context 'when importing good data' do
      it 'has two cohorts' do # Happy Path
        expect(conversion_test.control_group).to be_an_instance_of(Cohort)
        expect(conversion_test.test_group).to be_an_instance_of(Cohort)
      end

      it 'separates the data into the test and control groups' do # Happy Path
        conversion_test.import_data(parsed_json_data)
        expect(conversion_test.control_group).to have(1).items
        expect(conversion_test.test_group).to have(1).items
      end
    end

    context 'when importing bad data' do
      let(:conversion_test) { ConversionTest.new }
      let(:parsed_json_data) { [] }

      it 'raises an error if there are no website visits' do # Bad Path
        expect { conversion_test.import_data(parsed_json_data) }.to raise_error(ArgumentError, "The JSON file does not contain data points")
      end
    end

    context 'when calculating statistics on an A/B test with two cohorts' do
      before do
        conversion_test.control_group.conversions = 50
        conversion_test.control_group.non_conversions = 100
        conversion_test.test_group.conversions = 50
        conversion_test.test_group.non_conversions = 125
      end

      describe '#confidence_level' do
        it 'calculates the confidence level' do # Happy Path
          confidence_level = conversion_test.confidence_level
          expect(confidence_level).to be_within(0.001).of(0.646)
        end
      end

      describe '#confidence_level_helper' do
        it 'prints the confidence level in % format with a precision of 2' do # Happy Path
          pretty_confidence_level = conversion_test.confidence_level_helper
          expect(pretty_confidence_level).to eq("64.6%")
        end
      end
    end
  end
end
