require "rails_helper"

RSpec.describe CategoriesController, type: :routing do
  describe "routing" do
    context "categories" do
      it "routes to #show" do
        expect(:get => "/categories/blog").to route_to("categories#show", :id => "blog")
      end
    end
  end
end
