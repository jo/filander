require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Filander" do
  describe "Base" do
    include Filander::Base

    describe "join_source" do
      it "should return source_root" do
        join_source.should == Filander.source_root
      end

      it "should raise if source_root is nil" do
        lambda { join_source 'abc' }.should raise_error
      end

      it "should join source_root and filename" do
        Filander.source_root = 'abc'
        join_source('def').should == 'abc/def'
        Filander.source_root = nil
      end
    end

    describe "join_destination" do
      it "should return destination_root" do
        join_destination.should == Filander.destination_root
      end

      it "should raise if destination_root is nil" do
        lambda { join_destination 'abc' }.should raise_error
      end

      it "should join destination_root and filename" do
        Filander.destination_root = 'abc'
        join_destination('def').should == 'abc/def'
        Filander.destination_root = nil
      end
    end

    describe "create_directory" do
      it "should raise if destination_root is nil" do
        lambda { create_directory 'abc' }.should raise_error
      end

      describe "with source and destination" do
        before do
          setup_roots
        end

        after do
          teardown_roots
        end

        it "should create destination directory" do
          create_directory('mydir')
          File.directory?(join_destination('mydir')).should be_true
        end
      end
    end

    describe "create_directory_for" do
      it "should raise if destination_root is nil" do
        lambda { create_directory_for 'abc' }.should raise_error
      end

      describe "with source and destination" do
        before do
          setup_roots
        end

        after do
          teardown_roots
        end

        it "should create destination directory" do
          create_directory_for('mydir/myfile')
          File.directory?(join_destination('mydir')).should be_true
        end
      end
    end
  end
end
