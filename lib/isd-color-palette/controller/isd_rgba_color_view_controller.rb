# -*- coding: utf-8 -*-
class ISDRgbaColorViewController < UIViewController
  include BW::KVO
  
  attr_accessor :rView    # IBOutlet ISDRgbaSliderView
  attr_accessor :gView    # IBOutlet ISDRgbaSliderView
  attr_accessor :bView    # IBOutlet ISDRgbaSliderView
  attr_accessor :aView    # IBOutlet ISDRgbaSliderView
  
  attr_accessor :color
  
  attr_reader :views
  
=begin
  def initWithNibName nibNameOrNil, bundle:nibBundleOrNil
    super
    self
  end
=end
  
  def viewDidLoad
    super
    identities = %w(R G B A)
    @views = [rView, gView, bView, aView]
    @views.each_with_index do |v, i|
      v.identity = identities[i]
    end

  end

=begin
  def viewDidUnload
    super
  end
=end

  def dealloc
    unregist_kvo
  end

  def viewWillAppear animated
    super

    regist_kvo
    
    c = self.parentViewController.parentViewController
    set_color c.selectedColor
  end

  def regist_kvo
    return if @registed_kvo

    c = self.parentViewController.parentViewController
    observe c, "selectedColor" do |old, new|
      set_color new
    end
  end
  
  def unregist_kvo
    return unless @registed_kvo
    
    c = self.parentViewController.parentViewController
    unobserve c, "selectedColor"
  end
  
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

  def set_color color
    @views.each do |v|
      v.color = color
    end
  end
  
  def didChangeColor sender
    cancel_did_change_color
    schedule_did_change_color sender
  end
  
  private
  
  def schedule_did_change_color sender
    self.performSelector "force_did_change_color:", withObject:sender, afterDelay:0.2
  end
  
  def cancel_did_change_color
    self.class.cancelPreviousPerformRequestsWithTarget self
  end
  
  def force_did_change_color sender
    c = self.parentViewController.parentViewController
    color = UIColor.colorWithRed self.views[0].color_value,
                                     green:self.views[1].color_value,
                                      blue:self.views[2].color_value,
                                     alpha:self.views[3].color_value
    parentViewController.parentViewController.didChangeColor color
   end


end
