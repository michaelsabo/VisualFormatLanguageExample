//
//  ViewController.swift
//  VisualFormatLanguage
//
//  Created by Mike Sabo on 11/19/15.
//  Copyright © 2015 Mike Sabo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.edgesForExtendedLayout = UIRectEdge.None
    
    let label1 = UILabel()
    label1.translatesAutoresizingMaskIntoConstraints = false
    label1.backgroundColor = UIColor.lightGrayColor()
    label1.text = "Tommy Boy"
    
    let label2 = UILabel()
    label2.translatesAutoresizingMaskIntoConstraints = false
    label2.backgroundColor = UIColor.greenColor()
    label2.text = "Anchorman"
    
    let label3 = UILabel()
    label3.translatesAutoresizingMaskIntoConstraints = false
    label3.backgroundColor = UIColor.cyanColor()
    label3.text = "Kindergarten Cop"
    
    let label4 = UILabel()
    label4.translatesAutoresizingMaskIntoConstraints = false
    label4.backgroundColor = UIColor.orangeColor()
    label4.text = "Goonies"
    
    let label5 = UILabel()
    label5.translatesAutoresizingMaskIntoConstraints = false
    label5.backgroundColor = UIColor.cyanColor()
    label5.text = "Ninja Turtles....Turtle Power"
  
    
    view.addSubview(label1)
    view.addSubview(label2)
    view.addSubview(label3)
    view.addSubview(label4)
    view.addSubview(label5)
    
    //Add the label to a dictionary with a unique key
    // in this example i didnt have to explicility define the type of dictionary, aka String : UILabel
    // but if i had a UIButton, XCode would change this type to  String : UIView
    let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
    
    
    // this will add a horizontal constraint for all the labels, except for 2 and 3
    for label in viewsDictionary.keys {
      if (label == "label2" || label == "label3") {
        continue
      }
      view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
    }
    
    let halfScreenWidth = UIScreen.mainScreen().bounds.width/2
    
    // here we define a horizontal constraint for labels 2 and 3 so that they appear next to each other
    // the 999 is the constraint priority. It's set to 1000 by default. If autolayout had conflicting constraints it would throw an error 
    // in the debugger without changing the priority to 999
    view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label2(width@999)]-[label3(label2)]|", options: [], metrics: ["width": halfScreenWidth], views: viewsDictionary))
    
    // adding vertical constrains to the labels, except for label3
    // we also define a padding at the bottom of greater than or equal to 20 
    // we define a height of 100 and apply it to label1 
    // we then tell VSL to use the same height constraints with the other labels by referencing label 1 in the
    view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label1(height@999)]-[label2(label1)]-[label4(label1)]-[label5(label1)]->=20-|", options: [], metrics: ["height": 100], views: viewsDictionary))
    
    
    view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label1]-[label3(height@999)]-[label4]", options: [], metrics: ["height": 100], views: viewsDictionary))
  }
  
  



}

