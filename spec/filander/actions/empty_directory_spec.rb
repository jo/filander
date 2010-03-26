require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "EmptyDirectory" do
    include Filander::EmptyDirectory

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should create empty directory" do
      empty_directory 'mydir'
      File.directory?(join_destination('mydir')).should be_true
    end

    it "should create empty pending directories" do
      empty_directory 'mydir/mydir'
      File.directory?(join_destination('mydir/mydir')).should be_true
    end
  end
end
