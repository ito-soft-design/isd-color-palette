# -*- coding: utf-8 -*-
class ISDColorPaletteViewController < UIViewController

  attr_accessor :colorWellView      # IBOutlet UIView
  attr_accessor :colorNameLabel     # IBOutlet UILabel
  
  attr_accessor :selectedColor
  
  attr_accessor :selected_color_block   # -> {|color| }
  
  # If it's true, return nil when the color is the clear color.
  attr_accessor :return_nil
  

  attr_reader :color_layer, :solid_layer
  
  class << self
  
    def colorPaletteViewController
      sb = UIStoryboard.storyboardWithName "ISDColorPalette", bundle:nil
      sb.instantiateViewControllerWithIdentifier "ISDColorPaletteViewController"
    end
    
  end
  
=begin
  def initWithNibName nibNameOrNil, bundle:nibBundleOrNil
    super
    self
  end
=end
  
  def viewDidLoad
    super
    l = colorWellView.layer
    l.borderColor = :black.uicolor.cgcolor
    l.borderWidth = 2
    l.cornerRadius = 4
    l.masksToBounds = true
    @color_layer = l
    
    @solid_layer = CALayer.new
    r2 = Math.sqrt 2
    w = h = @color_layer.frame.size.height * r2
    x = CGRectGetMaxX(@color_layer.bounds) - w / 2
    y = -h / 2
    @solid_layer.frame = CGRectMake(x, y, w, h)
    rad = 45 * Math::PI / 180
    @solid_layer.transform = CATransform3DMakeRotation(rad, 0, 0, 1)
    @color_layer.addSublayer @solid_layer
    
    set_color self.selectedColor
  end

  def selectedColor= color
    willChangeValueForKey "selectedColor"
    @selectedColor = color
    didChangeValueForKey "selectedColor"
    set_color color
  end

=begin
  def viewDidUnload
    super
  end
=end

=begin
  def viewWillAppear animated
    super
  end
=end

=begin
  def viewDidAppear animated
    super
    set_color self.selectedColor
  end
=end

=begin  
  def viewWillDisappear animated
    super
  end
=end
  
=begin
  def viewDidDisappear animated
    super
  end
=end

=begin
  def shouldAutorotateToInterfaceOrientation interfaceOrientation
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
=end

=begin
  def shouldAutorotate
    true
  end
=end

=begin
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskPortrait
  end
=end

  def didChangeColor color
    self.selectedColor = color
    if self.selected_color_block
      color = nil if self.return_nil && color.alpha == 0
      self.selected_color_block.call color
    end
  end


  private

  def set_color color
    return unless colorWellView
    
    color ||= :clear.uicolor

    self.color_layer.backgroundColor = color.cgcolor
    self.color_layer.removeAllAnimations
    self.solid_layer.backgroundColor = color.uicolor(1).cgcolor
    self.solid_layer.removeAllAnimations

    colorNameLabel.text = color.color_name._
    colorNameLabel.textColor = color.monochrome.red >= 0.5 ? :black.uicolor : :white.uicolor
  end
  
end
