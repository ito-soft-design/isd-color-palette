# -*- coding: utf-8 -*-
class ISDColorPaletteCollectionViewCell < UICollectionViewCell

  attr_accessor :color
  
  attr_reader :inner_layer
  
  BASE_COLOR            = :dark_gray.uicolor
  BORDER_COLOR          = :white.uicolor
  SELECTED_BORDER_COLOR = :blue.uicolor
  
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
    l = self.contentView.layer
    l.borderColor = :clear.uicolor.cgcolor
    l.borderWidth = 3
    l.cornerRadius = 2
    l.frame = CGRectInset self.contentView.bounds, 3, 3
    
    self.backgroundView = UIView.new
    l = self.backgroundView.layer
    l.borderColor = BORDER_COLOR.cgcolor
    l.borderWidth = 2
    l.cornerRadius = 4
    l.shadowOpacity = 0.5
    
    self.selectedBackgroundView = UIView.new
    l = self.selectedBackgroundView.layer
    l.borderColor = SELECTED_BORDER_COLOR.cgcolor
    l.borderWidth = 2
    l.cornerRadius = 4
  end

  def color= color
    @color = color
    self.contentView.backgroundColor = color
  end
  
end

