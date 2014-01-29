# -*- coding: utf-8 -*-
class UIColor

  class << self
  
    def color_by_serialize s
      begin
        a = s.split(",")
        case a[0]
        when "RGBA"
          UIColor.colorWithRed a[1].to_f,
                         green:a[2].to_f,
                          blue:a[3].to_f,
                         alpha:a[4].to_f
        else
          nil
        end
      rescue
      end
    end
    
  end

  def to_serialize
    "RGBA,#{self.red},#{self.green},#{self.blue},#{self.alpha}"
  end
  
  def color_name
    return "Clear"._ if self.alpha == 0

    name = system_name || css_name || hex
    name = name.to_s unless name.is_a? String
    name.underscore.gsub(/_color/, "").gsub(/_/, " ").capitalize
  end

  def monochrome
    y = 0.299 * self.red + 0.587 * self.green + 0.114 * self.blue
    UIColor.alloc.initWithWhite y, alpha:self.alpha
  end

end
