require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "CopyDirectory" do
    include Filander::CopyDirectory

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should copy directory"
    it "should recursively copy directory"
  end
end
