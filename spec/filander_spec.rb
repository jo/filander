require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Filander" do
  describe "source_root" do
    it "should be accessible" do
      Filander.source_root = 'abc'
      Filander.source_root.should == 'abc'
      Filander.source_root = nil
    end
  end

  describe "destination_root" do
    it "should be accessible" do
      Filander.destination_root = 'abc'
      Filander.destination_root.should == 'abc'
      Filander.destination_root = nil
    end
  end

  describe "actions" do
    it "should include CopyFile" do
      Filander.included_modules.should include(Filander::CopyFile)
    end

    it "should include CreateFile" do
      Filander.included_modules.should include(Filander::CreateFile)
    end

    it "should include EmptyDirectory" do
      Filander.included_modules.should include(Filander::EmptyDirectory)
    end

    it "should include InjectIntoFile" do
      Filander.included_modules.should include(Filander::InjectIntoFile)
    end

    it "should include Inside" do
      Filander.included_modules.should include(Filander::Inside)
    end

    it "should include Template" do
      Filander.included_modules.should include(Filander::Template)
    end
  end
end
