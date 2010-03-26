require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Filander" do
  describe "InjectIntoFile" do
    include Filander::InjectIntoFile

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should inject after specified content into file"
    it "should inject before specified content into file"
  end
end
