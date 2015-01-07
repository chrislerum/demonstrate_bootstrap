require 'rails_helper'

RSpec.describe "routing to bottles on homepage" do
  it "routes / to bottles#index" do
    expect(:get => "/").to route_to(
      :controller => "bottles",
      :action => "index"
    )
  end
end
