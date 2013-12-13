module Jekyll
  module CroquisFilter
    def truncateUTF8(input, length = 50, truncate_string = "...")
      if input.nil? then return end
      l = length.to_i - truncate_string.length
      l = 0 if l < 0
      utf8 = input.unpack("U*")
      utf8.length > length.to_i ? utf8[0...l].pack("U*") + truncate_string : input
    end
  end
end

Liquid::Template.register_filter(Jekyll::CroquisFilter)
