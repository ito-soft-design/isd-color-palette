# -*- coding: utf-8 -*-
class ISDColorPaletteViewController < UIViewController

  attr_accessor :colorWellView      # IBOutlet UIView
  attr_accessor :colorNameLabel     # IBOutlet UILabel
  
  attr_accessor :selectedColor
  
  attr_accessor :selected_color_block   # -> {|color| }
  
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
    
    set_color self.selectedColor
  end

  def selectedColor= color
    @selectedColor = color
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

  def clearColor sender # IBAction
    didChangeColor nil
  end

  def didChangeColor color
    self.selectedColor = color
    if self.selected_color_block
      self.selected_color_block.call color
    end
  end


  private

  def set_color color
    return unless colorWellView
    
    case color
    when nil, UIColor.clearColor
      colorWellView.layer.backgroundColor = nil
      colorNameLabel.text = "None"._
    else
      colorWellView.layer.backgroundColor = color.CGColor
      colorNameLabel.text = nil
    end
  end
  
end
