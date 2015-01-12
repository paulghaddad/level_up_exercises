require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe "markdown" do
    let(:markdown_text) { "This is *bongos*, indeed." }

    it "outputs markdown into HTML" do
      expect(markdown(markdown_text)).to eq("<p>This is <em>bongos</em>, indeed.</p>\n")
    end
  end
end
