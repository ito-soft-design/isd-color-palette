# -*- coding: utf-8 -*-
class MainViewController < UIViewController

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

  def showColorPalette sender   # IBAction
    c = ISDColorPaletteViewController.colorPaletteViewController
    c.selectedColor = self.view.backgroundColor
    c.selected_color_block = Proc.new {|color| did_select_color color }
    self.navigationController.pushViewController c, animated:true
  end
  
  def did_select_color color
    self.view.backgroundColor = color
  end
  
end
