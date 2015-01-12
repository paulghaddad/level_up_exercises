require 'rails_helper'

RSpec.describe UsersHelper, :type => :helper do

  describe "#account_type" do

      it "displays Administrator if user is an admin" do
        @user =  create(:user, admin: true)

        expect(helper.account_type).to eq("Administrator")
      end


      it "displays Basic if user is not an admin" do
        @user =  create(:user)

        expect(helper.account_type).to eq("Basic")
      end
  end
end
