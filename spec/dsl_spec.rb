$:.unshift("lib")

require "hateoas/dsl"

describe Hateoas::Dsl do
  it "has a click_link method" do
    subject.respond_to?(:click_link).should be_true
  end
end
