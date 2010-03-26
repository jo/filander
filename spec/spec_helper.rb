$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'filander'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end

SOURCE_ROOT      = File.expand_path(File.dirname(__FILE__) + '/source')
DESTINATION_ROOT = File.expand_path(File.dirname(__FILE__) + '/destination')

Filander.quiet = true

def setup_roots
  Filander.source_root      = SOURCE_ROOT
  Filander.destination_root = DESTINATION_ROOT
end

def teardown_roots
  FileUtils.rm_rf(Filander.destination_root)
  Filander.source_root      = nil
  Filander.destination_root = nil
end
