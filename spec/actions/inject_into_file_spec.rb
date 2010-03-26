require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Filander" do
  describe "InjectIntoFile" do
    include Filander::InjectIntoFile

    before do
      setup_roots
      FileUtils.mkdir_p Filander.destination_root
      @filename = join_destination('myfile')
      File.open(@filename, 'w') { |file| file << 'data' }
    end

    after do
      teardown_roots
    end

    it "should inject data before specified content into file" do
      inject_into_file 'myfile', 'mydata', :before => 'data'
      File.read(@filename).should == "mydatadata"
    end

    it "should inject data after specified content into file" do
      inject_into_file 'myfile', 'mydata', :after => 'data'
      File.read(@filename).should == "datamydata"
    end

    it "should inject data from block before specified content into file" do
      inject_into_file 'myfile', :before => 'data' do
        'mydata'
      end
      File.read(@filename).should == "mydatadata"
    end

    it "should inject data from block after specified content into file" do
      inject_into_file 'myfile', :after => 'data' do
        'mydata'
      end
      File.read(@filename).should == "datamydata"
    end

    it "should inject data before specified content via regexp into file" do
      inject_into_file 'myfile', 'mydata', :before => /ta/
      File.read(@filename).should == "damydatata"
    end
  end
end
