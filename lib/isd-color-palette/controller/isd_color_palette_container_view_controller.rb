# -*- coding: utf-8 -*-
class ISDColorPaletteContainerViewController < UIViewController

  attr_accessor :basicColorView     # IBOutlet UIView
  attr_accessor :rgbaColorView      # IBOutlet UIView
  attr_accessor :webSafeColorView   # IBOutlet UIView
  
=begin
  def initWithNibName nibNameOrNil, bundle:nibBundleOrNil
    super
    self
  end
=end
  
=begin
  def viewDidLoad
    super
  end
=end

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

end
