require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Filander" do
  describe "source_root" do
    it "should be accessible" do
      old = Filander.source_root
      Filander.source_root = 'abc'
      Filander.source_root.should == 'abc'
      Filander.source_root = old
    end
  end

  describe "destination_root" do
    it "should be accessible" do
      old = Filander.destination_root
      Filander.destination_root = 'abc'
      Filander.destination_root.should == 'abc'
      Filander.destination_root = old
    end
  end

  describe "quiet" do
    it "should be accessible" do
      old = Filander.quiet
      Filander.quiet = true
      Filander.quiet.should == true
      Filander.quiet = old
    end
  end

  describe "behavior" do
    it "should be accessible" do
      old = Filander.behavior
      Filander.behavior = :skip
      Filander.behavior.should == :skip
      Filander.behavior = old
    end
  end

  describe "actions" do
    it "should include Cmd" do
      Filander.included_modules.should include(Filander::Cmd)
    end


    it "should include Chown" do
      Filander.included_modules.should include(Filander::Chown)
    end

    it "should include CopyDirectory" do
      Filander.included_modules.should include(Filander::CopyDirectory)
    end

    it "should include CopyFile" do
      Filander.included_modules.should include(Filander::CopyFile)
    end

    it "should include CreateFile" do
      Filander.included_modules.should include(Filander::CreateFile)
    end

    it "should include EmptyDirectory" do
      Filander.included_modules.should include(Filander::EmptyDirectory)
    end

    it "should include GitClone" do
      Filander.included_modules.should include(Filander::GitClone)
    end

    it "should include InjectIntoFile" do
      Filander.included_modules.should include(Filander::InjectIntoFile)
    end

    it "should include Inside" do
      Filander.included_modules.should include(Filander::Inside)
    end

    it "should include InstallGem" do
      Filander.included_modules.should include(Filander::InstallGem)
    end

    it "should include Template" do
      Filander.included_modules.should include(Filander::Template)
    end
  end
end
