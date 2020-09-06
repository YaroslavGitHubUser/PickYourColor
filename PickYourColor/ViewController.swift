//
//  ViewController.swift
//  PickYourColor
//
//  Created by Yaroslav on 23.08.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: - Outlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redIntensityLabel: UILabel!
    @IBOutlet var greenIntensityLabel: UILabel!
    @IBOutlet var blueIntensityLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!

// MARK: - Properties
    
    var colorViewPassed: (red: CGFloat,
                        green: CGFloat,
                        blue: CGFloat,
                        alpha: CGFloat)!
    
    var delegate: ViewControllerDelegate!
    
// MARK: - Overrided Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.layer.cornerRadius = 10
        
        redIntensityLabel.text = String((Float(colorViewPassed.red) * 100).rounded() / 100)
        greenIntensityLabel.text = String((Float(colorViewPassed.green) * 100).rounded() / 100)
        blueIntensityLabel.text = String((Float(colorViewPassed.blue) * 100).rounded() / 100)
        
        redSlider.value = Float(colorViewPassed.red)
        greenSlider.value = Float(colorViewPassed.green)
        blueSlider.value = Float(colorViewPassed.blue)
        
        colorView.backgroundColor = UIColor(red: colorViewPassed.red,
                                            green: colorViewPassed.green,
                                            blue: colorViewPassed.blue,
                                            alpha: 1)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

// MARK: - IBActions

    @IBAction func sliderAction() {
        changeText()
        showColor()
    }
    
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(red: CGFloat(redSlider.value),
                          green: CGFloat(greenSlider.value),
                          blue: CGFloat(blueSlider.value))
    }

// MARK: - Private Functions

    private func showColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func changeText() {
        redIntensityLabel.text = String((redSlider.value * 100).rounded() / 100)
        greenIntensityLabel.text = String((greenSlider.value * 100).rounded() / 100)
        blueIntensityLabel.text = String((blueSlider.value * 100).rounded() / 100)
    }
}

// MARK: - Extension

extension ViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = Float(textField.text!) else {return}
        switch textField.tag {
        case 0: redSlider.value = newValue
        case 1: greenSlider.value = newValue
        case 2: blueSlider.value = newValue
        default: break
        }
        
        showColor()
        changeText()
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
}

