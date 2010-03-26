require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "Template" do
    include Filander::Template

    def data
      "mydata"
    end

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should create myfile" do
      template 'mytemplate', 'myfile'
      File.file?(join_destination('myfile')).should be_true
    end

    it "should create file" do
      template 'mytemplate'
      File.file?(join_destination('mytemplate')).should be_true
    end

    it "should create file and subdir" do
      template 'mydir/mytemplate'
      File.directory?(join_destination('mydir')).should be_true
      File.file?(join_destination('mydir/mytemplate')).should be_true
    end

    it "should write erb evaluated content" do
      template 'mytemplate'
      File.read(join_destination('mytemplate')).should == "mydata\n"
    end
  end
end
