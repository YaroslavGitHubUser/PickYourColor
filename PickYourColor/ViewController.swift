//
//  ViewController.swift
//  PickYourColor
//
//  Created by Yaroslav on 23.08.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redIntensityLabel: UILabel!
    @IBOutlet var greenIntensityLabel: UILabel!
    @IBOutlet var blueIntensityLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        redIntensityLabel.text = String(redSlider.value)
        greenIntensityLabel.text = String(greenSlider.value)
        blueIntensityLabel.text = String(blueSlider.value)
        
        showColor()
    }


    @IBAction func redSliderAction() {
        redIntensityLabel.text = String((redSlider.value * 100).rounded() / 100)
        showColor()
    }
    
    @IBAction func greenSliderAction() {
        greenIntensityLabel.text = String((greenSlider.value * 100).rounded() / 100)
        showColor()
    }
    
    @IBAction func blueSliderAction() {
        blueIntensityLabel.text = String((blueSlider.value * 100).rounded() / 100)
        showColor()
    }
    
    
    private func showColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
}

