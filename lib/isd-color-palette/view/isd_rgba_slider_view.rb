# -*- coding: utf-8 -*-
class ISDRgbaSliderView < UIView

  attr_accessor :viewController   # IBOutlet UIViewController
  attr_accessor :sliderBaseView   # IBOutlet UIView
  attr_accessor :valueTextField   # IBOutlet UITextField
  attr_accessor :idLabel          # IBOutlet UILabel
  
  attr_accessor :color_value
  attr_accessor :identity
  
  attr_reader :slider
  
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
  
    l = self.layer
    l.borderColor = :white.uicolor.cgcolor
    l.borderWidth = 3
    l.cornerRadius = 4
  
    # setup slider
    
    @slider = UISlider.new
    @slider.frame = CGRectInset sliderBaseView.bounds, 0, 8
    rad = -90 * Math::PI / 180
    @slider.transform = CGAffineTransformMakeRotation(rad)
    sliderBaseView << @slider

    @slider.addTarget self, action:"didChangeValue:", forControlEvents:UIControlEventValueChanged

  end
  
  def layoutSubviews
    super
    return unless self.slider
    
    self.slider.frame = CGRectInset self.sliderBaseView.bounds, 0, 8
  end
  

  def color= color
    @color = color
    @color_value = 0
    if color
      case self.identity
      when "R"
        @color_value = color.red
      when "G"
        @color_value = color.green
      when "B"
        @color_value = color.blue
      when "A"
        @color_value = color.alpha
      end
      set_color_value_to_controls
      set_backgournd_color
    end
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

  def didChangeValue sender # IBAction
    case sender
    when UISlider
      @color_value = sender.value
    when UITextField
      @color_value = sender.text.to_f / 255.0
    end
    set_color_value_to_controls
    self.viewController.didChangeColor sender
  end
  
  def set_color_value_to_controls
    self.valueTextField.text = [(self.color_value * 255 + 0.5), 255.0].min.to_i.to_s
    self.slider.value = self.color_value
  end

  def set_backgournd_color
    case self.identity
    when "R"
      bg_color = :red.uicolor
    when "G"
      bg_color = :green.uicolor
    when "B"
      bg_color = :blue.uicolor
    when "A"
      bg_color = :white.uicolor
    end
    self.backgroundColor = :black.uicolor.mix_with bg_color, self.color_value
    self.idLabel.textColor = UIColor.colorWithWhite(self.color_value, alpha:1.0).invert if self.idLabel
  end

  # UITextField delegate
  def textFieldDidEndEditing(textField)
    if /^\s*\d+\s*$/ =~ textField.text
      @color_value = [textField.text.to_i, 255].min / 255.0
    end
    didChangeValue self
  end

  def textFieldShouldReturn(textField)
    hide_keyboard textField
    true
  end
  
  def hide_keyboard textField = self.valueTextField
    textField.resignFirstResponder if textField
  end

end

