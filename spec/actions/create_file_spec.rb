require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Filander" do
  describe "CreateFile" do
    include Filander::CreateFile

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should create file" do
      create_file 'myfile', 'data'
      File.file?(join_destination('myfile')).should be_true
    end

    it "should create file and subdir" do
      create_file 'mydir/myfile', 'data'
      File.directory?(join_destination('mydir')).should be_true
      File.file?(join_destination('mydir/myfile')).should be_true
    end

    it "should write content" do
      create_file 'myfile', 'data'
      File.read(join_destination('myfile')).should == 'data'
    end
  end
end
