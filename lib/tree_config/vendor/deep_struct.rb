module TreeConfig 
  class DeepStruct < OpenStruct
    def initialize(hash=nil)
      @table = {}
      @hash_table = {}

      if hash
        hash.each do |k,v|
          raise KeyIsFixNum if k.instance_of?(Fixnum)
          @table[k.to_sym] = (v.is_a?(Hash) ? self.class.new(v) : v)
          @hash_table[k.to_sym] = v
          new_ostruct_member(k)
        end
      end
    end

    def to_h
      @hash_table
    end

    def empty?
      self.hash == 0
    end

    def size
      sum = 0
      self.each_pair { |p| sum += 1 }
      sum
    end
  end
end
