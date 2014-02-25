require "spec_helper"

describe OrdersController do
  describe "routing" do

    it "routes to #new" do
      get("/checkout").should route_to("orders#new")
    end

    it "routes to #create" do
      post("/orders").should route_to("orders#create")
    end
    it "routes to #complete" do
      get("orders/complete").should route_to("orders#complete")
    end


  end
end
