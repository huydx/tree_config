require 'ostruct'
require 'yaml'

module TreeConfig
  class DirectoryTree
    def self.load(dir, struct_obj)
      Dir.foreach(dir) do |entry|
        next if (entry == '..' || entry == '.')
        full_path = File.join(dir, entry)
        if File.directory? (full_path)
          struct_obj.send("#{entry}=", DeepStruct.new)
          struct_obj.send("#{entry}=", self.load(full_path, struct_obj.send("#{entry}")))
        else
          next if entry.empty? || (entry[-3,3] != "yml" && entry[-4,4] != "yaml") 
          hash = ActiveSupport::HashWithIndifferentAccess.new(
            begin 
              YAML.load(File.open(full_path))
            rescue
            end
          )
          name = File.basename(entry, '.*')
          struct_obj.send("#{name}=", DeepStruct.new(hash))
        end
      end
      return struct_obj
    end
  end
end
