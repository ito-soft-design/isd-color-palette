# -*- coding: utf-8 -*-
class ISDBasicColorCollectionViewController < UICollectionViewController

  def viewDidLoad
    super
    @system_colors = [:white, :black, :dark_gray, :light_gray, :gray,
                      :red, :blue, :cyan, :yellow, :magenta, :orange, :purple, :brown
                     ]
  end

  def numberOfSectionsInCollectionView collectionView
    2
  end
  
  def collectionView collectionView, numberOfItemsInSection:section
    case section
    when 0
      @system_colors.size
    when 1
      @system_colors.size
    end
  end

  def collectionView collectionView, viewForSupplementaryElementOfKind:kind, atIndexPath:indexPath
    view = collectionView.dequeueReusableSupplementaryViewOfKind kind, withReuseIdentifier:"Header", forIndexPath:indexPath
    case indexPath.section
    when 0
      view.headerLabel.text = "Recent"._
    when 1
      view.headerLabel.text = "System"._
    end
    view
  end

  CellIdentifier = "ColorWell"
  def collectionView collectionView, cellForItemAtIndexPath:indexPath
    cell = collectionView.dequeueReusableCellWithReuseIdentifier CellIdentifier, forIndexPath:indexPath
    case indexPath.section
    when 0
      cell.color = @system_colors[indexPath.row].uicolor
    when 1
      cell.color = @system_colors[indexPath.row].uicolor
    else
    end
    cell
  end
  
  def collectionView collectionView, didSelectItemAtIndexPath:indexPath
    cell = collectionView.cellForItemAtIndexPath indexPath
    parentViewController.parentViewController.didChangeColor cell.color
    collectionView.selectItemAtIndexPath indexPath, animated:true, scrollPosition:UICollectionViewScrollPositionCenteredVertically
  end


  def collectionView collectionView, didDeselectItemAtIndexPath:indexPath
    cell = collectionView.cellForItemAtIndexPath indexPath
    collectionView.deselectItemAtIndexPath indexPath, animated:true
  end


end

