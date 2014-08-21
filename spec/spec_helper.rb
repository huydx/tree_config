require 'tree_config'
require 'pathname'
require 'bundler/setup'

RSpec.configure do |c|
  c.color = true
  c.run_all_when_everything_filtered = true
  c.before(:all) do
    @fixture_path = Pathname.new(File.join(File.dirname(__FILE__), '/fixtures'))
    raise "Fixture folder not found" unless @fixture_path.directory?
  end

  def setting_folder(folder_name)
    @fixture_path.join(folder_name)
  end
end
