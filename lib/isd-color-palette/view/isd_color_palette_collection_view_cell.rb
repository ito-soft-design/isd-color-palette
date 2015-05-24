# -*- coding: utf-8 -*-
class ISDColorPaletteCollectionViewCell < UICollectionViewCell

  attr_accessor :color
  
  attr_reader :border_color, :selected_border_color
  attr_reader :color_layer, :solid_layer
  
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

    l = CALayer.layer
    l.borderColor = :clear.uicolor.cgcolor
    l.borderWidth = 3
    l.cornerRadius = 2
    l.masksToBounds = true
    l.frame = CGRectInset self.contentView.bounds, 3, 3
    @color_layer = l
    self.contentView.layer.addSublayer @color_layer
    
    @solid_layer = CALayer.new
    f = @color_layer.bounds
    w = f.size.width
    h = f.size.height
    x = CGRectGetMaxX(f) - w / 2
    y = CGRectGetMinY(f) - h / 2
    @solid_layer.frame = CGRectMake(x, y, w, h)
    rad = 45 * Math::PI / 180
    @solid_layer.transform = CATransform3DMakeRotation(rad, 0, 0, 1)
    @color_layer.addSublayer @solid_layer
    
    self.backgroundView = UIView.new
    l = self.backgroundView.layer
    l.borderColor = self.border_color.cgcolor
    l.borderWidth = 2
    l.cornerRadius = 4
    l.shadowOpacity = 0.5
    l.masksToBounds = true
    l.shadowPath = UIBezierPath.bezierPathWithRect(self.bounds).CGPath
    l.shouldRasterize = true
    l.rasterizationScale = UIScreen.mainScreen.scale
    
    self.selectedBackgroundView = UIView.new
    l = self.selectedBackgroundView.layer
    l.borderColor = self.selected_border_color.cgcolor
    l.borderWidth = 2
    l.cornerRadius = 4
    l.masksToBounds = true
  end

  def color= color
    @color = color

    self.color_layer.backgroundColor = color.cgcolor
    self.color_layer.removeAllAnimations
    self.solid_layer.backgroundColor = color.uicolor(1.0).cgcolor
    self.solid_layer.removeAllAnimations
  end
  
end

