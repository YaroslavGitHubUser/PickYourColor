//
//  InitialViewController.swift
//  PickYourColor
//
//  Created by Yaroslav on 05.09.2020.
//  Copyright © 2020 Yaroslav. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func setColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class InitialViewController: UIViewController {

    @IBOutlet var mainView: UIView!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rgbaChosen = mainView.backgroundColor?.rgba
        let colorVC = segue.destination as! ViewController
        colorVC.colorViewPassed = rgbaChosen
        
        colorVC.delegate = self
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
}

extension InitialViewController: ViewControllerDelegate {
    func setColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        mainView.backgroundColor = UIColor(red: red,
                                           green: green,
                                           blue: blue,
                                           alpha: 1)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
