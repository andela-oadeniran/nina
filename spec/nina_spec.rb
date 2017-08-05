require "spec_helper"

RSpec.describe Nina do
  it "has a version number" do
    expect(Nina::VERSION).not_to be nil
  end

  it "responds to a call method" do
    expect(Nina::Application.new).to respond_to(:call).with(1).argument
  end
end
