# -*- coding: utf-8 -*-
class ISDColorPaletteContainerViewController < UIViewController

  attr_accessor :basicColorView     # IBOutlet UIView
  attr_accessor :rgbaColorView      # IBOutlet UIView
  attr_accessor :webSafeColorView   # IBOutlet UIView
  
  attr_reader :views
  
=begin
  def initWithNibName nibNameOrNil, bundle:nibBundleOrNil
    super
    self
  end
=end
  
  def viewDidLoad
    super
    @views = [
                self.basicColorView,
                self.rgbaColorView,
                self.webSafeColorView
              ]
    
    select_view self.basicColorView
  end
  
  def select_view view
    self.views.each do |v|
      if v
        v.hidden = v != view
      end
    end
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

  def didChangeValue sender # IBAction
    view = self.views[sender.selectedSegmentIndex]
    select_view view
  end

end
