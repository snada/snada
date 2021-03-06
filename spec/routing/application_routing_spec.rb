require "rails_helper"

RSpec.describe ApplicationController, type: :routing do
  describe "routing" do
    context "application" do
      it "routes to #index" do
        expect(get: "/").to route_to("application#index")
      end

      it "routes to #about" do
        expect(get: "/about").to route_to("application#about")
      end
    end
  end
end
