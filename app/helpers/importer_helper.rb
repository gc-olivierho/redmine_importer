module ImporterHelper
  def matched_attrs(column)
    match = @attrs.find { |k,v| 
      v.to_s.casecmp(column.strip.sub(" ") {|sp| "_" }) == 0 || k.casecmp(column.strip) == 0
    }
    match.nil? ? nil : match[1]
  end

  def force_utf8(str)
    str.unpack("U*").pack('U*')
  end
end
