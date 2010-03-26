require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "CopyFile" do
    include Filander::CopyFile

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should copy myfile to otherfile" do
      copy_file 'myfile', 'otherfile'
      File.file?(join_destination('otherfile')).should be_true
    end

    it "should copy file" do
      copy_file 'myfile'
      File.file?(join_destination('myfile')).should be_true
    end

    it "should copy file and create directory" do
      copy_file 'mydir/myfile'
      File.file?(join_destination('mydir/myfile')).should be_true
    end
  end
end
