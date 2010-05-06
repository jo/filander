require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "Chown" do
    include Filander::Chown

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should change uid"
    it "should recursively change uid"
  end
end
