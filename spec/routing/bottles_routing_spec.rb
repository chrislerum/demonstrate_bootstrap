require 'rails_helper'

RSpec.describe "routing to bottles index" do
  it "routes /bottles to bottles#index" do
    expect(:get => "/bottles").to route_to(
      :controller => "bottles",
      :action => "index"
    )
  end
end
