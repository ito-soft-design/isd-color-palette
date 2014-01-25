# -*- coding: utf-8 -*-
class ISDBasicColorCollectionReusableView < UICollectionReusableView

  attr_accessor :headerLabel    # IBOutlet
  
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
    self.backgroundColor = :light_gray.uicolor
  end

=begin
  def drawRect rect
    context = UIGraphicsGetCurrentContext()
    # Draw your code here.
  end
=end

=begin
  def shouldAutorotateToInterfaceOrientation interfaceOrientation
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
=end

end

