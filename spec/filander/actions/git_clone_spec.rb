require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "GitClone" do
    include Filander::GitClone

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should clone repro"
  end
end
