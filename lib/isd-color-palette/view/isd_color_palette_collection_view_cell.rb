# -*- coding: utf-8 -*-
class ISDColorPaletteCollectionViewCell < UICollectionViewCell

  attr_accessor :color
  
  attr_reader :inner_layer
  
  attr_reader :border_color, :selected_border_color
  
=begin
  def initWithFrame frame
    super
    self
  end
=end

=begin
  def initWithCorder decode
    super
    self
  end
=end

  def awakeFromNib
    @border_color          = :white.uicolor
    @selected_border_color = :blue.uicolor

    l = self.contentView.layer
    l.borderColor = :clear.uicolor.cgcolor
    l.borderWidth = 3
    l.cornerRadius = 2
    l.frame = CGRectInset self.contentView.bounds, 3, 3
    
    self.backgroundView = UIView.new
    l = self.backgroundView.layer
    l.borderColor = self.border_color.cgcolor
    l.borderWidth = 2
    l.cornerRadius = 4
    l.shadowOpacity = 0.5
    
    self.selectedBackgroundView = UIView.new
    l = self.selectedBackgroundView.layer
    l.borderColor = self.selected_border_color.cgcolor
    l.borderWidth = 2
    l.cornerRadius = 4
  end

  def color= color
    @color = color
    self.contentView.backgroundColor = color
  end
  
end

