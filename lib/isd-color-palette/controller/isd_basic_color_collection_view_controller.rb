# -*- coding: utf-8 -*-
class ISDBasicColorCollectionViewController < UICollectionViewController

  attr_reader :recent_colors, :system_colors, :web_colors
  
  def viewDidLoad
    super
    
    load_recent_colors
    
    @system_colors = [:clear, :white, :black, :dark_gray, :light_gray, :gray,
                      :red, :blue, :cyan, :yellow, :magenta, :orange, :purple, :brown
                     ]
    @web_colors = Symbol.css_colors.dup.sort{|a, b|
                    f = (a.last >> 16) <=> (b.last >> 16)
                    case f
                    when 0
                      f = (a.last >> 8 & 0xff) <=> (b.last >> 8 & 0xff)
                      case f
                      when 0
                        (a.last & 0xff) <=> (b.last & 0xff)
                      else
                        f
                      end
                    else
                      f
                    end
                  }.map{|e| e.first}
  end
  
  def viewWillDisappear animated
    super
    record_recent_color
    save_recent_colors
  end

  def numberOfSectionsInCollectionView collectionView
    3
  end
  
  def collectionView collectionView, numberOfItemsInSection:section
    case section
    when 0
      self.recent_colors.size
    when 1
      self.system_colors.size
    when 2
      self.web_colors.size
    end
  end

  def collectionView collectionView, viewForSupplementaryElementOfKind:kind, atIndexPath:indexPath
    view = collectionView.dequeueReusableSupplementaryViewOfKind kind, withReuseIdentifier:"Header", forIndexPath:indexPath
    case indexPath.section
    when 0
      view.headerLabel.text = "Recent"._
    when 1
      view.headerLabel.text = "System"._
    when 2
      view.headerLabel.text = "Web"._
    end
    view
  end

  CellIdentifier = "ColorWell"
  def collectionView collectionView, cellForItemAtIndexPath:indexPath
    cell = collectionView.dequeueReusableCellWithReuseIdentifier CellIdentifier, forIndexPath:indexPath
    case indexPath.section
    when 0
      cell.color = self.recent_colors[indexPath.row].uicolor
    when 1
      cell.color = self.system_colors[indexPath.row].uicolor
    when 2
      cell.color = self.web_colors[indexPath.row].uicolor
    else
    end
    cell
  end
  
  def collectionView collectionView, didSelectItemAtIndexPath:indexPath
    cell = collectionView.cellForItemAtIndexPath indexPath
    parentViewController.parentViewController.didChangeColor cell.color
    collectionView.selectItemAtIndexPath indexPath, animated:true, scrollPosition:UICollectionViewScrollPositionNone
  end


  def collectionView collectionView, didDeselectItemAtIndexPath:indexPath
    cell = collectionView.cellForItemAtIndexPath indexPath
    collectionView.deselectItemAtIndexPath indexPath, animated:true
  end


  private
  
  def load_recent_colors
    @recent_colors = []
    begin
      a = NSUserDefaults["isd_color_palette_recent_colors"] || []
      a.each do |s|
        @recent_colors << UIColor.color_by_serialize(s)
      end
    rescue
    end
  end
  
  def record_recent_color
    color = self.parentViewController.parentViewController.selectedColor
    @recent_colors.unshift color
  end
  
  def save_recent_colors
    a = @recent_colors.map do |c|
      (c || :clear.uicolor).to_serialize
    end
    # limit 7 x 3
    a.uniq!
    a[0, 21]
    NSUserDefaults["isd_color_palette_recent_colors"] = a
  end


end

