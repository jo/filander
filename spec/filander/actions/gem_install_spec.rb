require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "GemInstall" do
    include Filander::GemInstall

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should install gem"
    it "should not install gem when already installed"
  end
end
