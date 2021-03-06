require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "Inside" do
    include Filander::Inside

    before do
      setup_roots
    end

    after do
      teardown_roots
    end

    it "should change to source directory" do
      inside 'mydir' do
        Dir.pwd.should == File.join(SOURCE_ROOT, 'mydir')
      end
    end

    it "should change to source directory otherdir" do
      inside 'mydir', 'otherdir' do
        Dir.pwd.should == File.join(SOURCE_ROOT, 'mydir')
      end
    end

    it "should set destination directory" do
      inside 'mydir' do
        Filander.destination_root == File.join(DESTINATION_ROOT, 'mydir')
      end
    end

    it "should set destination directory to otherdir" do
      inside 'mydir', 'otherdir' do
        Filander.destination_root == File.join(DESTINATION_ROOT, 'otherdir')
      end
    end

    it "should reset pwd" do
      pwd = FileUtils.pwd
      inside 'mydir' do
      end
      FileUtils.pwd.should == pwd
    end

    it "should create destination directory" do
      inside 'mydir' do
      end
      File.directory?(join_destination('mydir')).should be_true
    end
  end
end
