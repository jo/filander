require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "Cmd" do
    include Filander::Cmd

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should execute command"
  end
end
