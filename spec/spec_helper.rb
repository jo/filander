$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'filander'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end

def setup_roots
  Filander.source_root      = File.expand_path(File.dirname(__FILE__) + '/source')
  Filander.destination_root = File.expand_path(File.dirname(__FILE__) + '/destination')
end

def teardown_roots
  FileUtils.rm_rf(Filander.destination_root)
  Filander.source_root      = nil
  Filander.destination_root = nil
end
