require 'rails_helper'

describe Bottle do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:color)}
end

