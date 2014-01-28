# ISDColorPalette

ISDColorPalette is a color selection panel for the RubyMotion iOS app.

![Screenshot](https://raw.github.com/ito-soft-design/isd-color-palette/master/screenshots/screenshot-0.1.1.png)

## Installation

```ruby
# in Gemfile
gem 'isd-color-palette'
```

ISDColorPalette uses Sugarcube and BubbleWrap.

```ruby
# in Gemfile
gem 'bubble-wrap'
# minimum set
gem 'sugarcube', :require => [
      'sugarcube-core',
      'sugarcube-localized',
      'sugarcube-color',
      'sugarcube-uikit',
      'sugarcube-nsuserdefaults'
    ]
```


## Usage


```ruby
# attr_accessor :color

# get a controller.
c = ISDColorPaletteViewController.colorPaletteViewController
# set an initial color.
c.selectedColor = self.color
# set a callback.
c.selected_color_block = Proc.new {|color| did_select_color color }
# push the controller.
self.navigationController.pushViewController c, animated:true
```

If you want to get nil instead of the clear color, set #return_nil true.

```
  c.return_nil = true
```

The selected_color_block is called after a color is selected.

```
def did_select_color color
  p color
  self.color = color
end
```

## License

MIT License  


