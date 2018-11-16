//
//  ResultsViewController.swift
//  ColorZ
//
//  Created by Łukasz Sokołowski on 15/11/2018.
//  Copyright © 2018 Łukasz Sokołowski. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var redValue:   Int = 0
    var greenValue: Int = 0
    var blueValue:  Int = 0
    
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var rValueLabel: UILabel!
    @IBOutlet weak var gValueLabel: UILabel!
    @IBOutlet weak var bValueLabel: UILabel!
    
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var labelK: UILabel!
    
    @IBOutlet weak var colorPreView: UIView!
    
    @IBOutlet weak var hexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStaticLabels()
        setRGBLabels()
        rgb2cmyk(red: redValue, green: greenValue, blue: blueValue)
        paintColorPreview()
        setHexLabel()
        
        var tablica = rgb2hsv(red: Float(redValue), grn: Float(greenValue), blu: Float(blueValue))
        print(tablica)
    }

    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setStaticLabels() {
        rLabel.text = "R:"
        gLabel.text = "G:"
        bLabel.text = "B:"
    }
    func setRGBLabels() {
        
        rValueLabel.text = String(redValue)
        gValueLabel.text = String(greenValue)
        bValueLabel.text = String(blueValue)
    }
    func setHexLabel() {
        hexLabel.text = "#" + rgb2hex()
    }
    func paintColorPreview() {
       
        let red = CGFloat(CGFloat(redValue)/255)
        //print(red)
        let green = CGFloat(CGFloat(greenValue)/255)
        //print(green)
        let blue = CGFloat(CGFloat(blueValue)/255)
        //print(blue)
        
        colorPreView.layer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
        
        colorPreView.layer.borderWidth = 2
    }
    func rgb2cmyk(red: Int,green: Int, blue: Int) {
        let redNew = Float(Float(red)/255)
        let greenNew = Float(Float(green)/255)
        let blueNew = Float(Float(blue)/255)
        
        let maxValueOfRGB = max(redNew, greenNew, blueNew)
        
        let K =  1 - maxValueOfRGB
        let C = (1 - redNew - K)/(1 - K)
        let M = (1 - greenNew - K)/(1 - K)
        let Y = (1 - blueNew - K)/(1 - K)
        
        labelC.text = String(C)
        labelM.text = String(M)
        labelY.text = String(Y)
        labelK.text = String(K)
    }
    
    func rgb2hex() -> String {
        let hex = String(format:"%02X", Int(redValue)) + String(format:"%02X", Int(greenValue)) + String(format:"%02X", Int(blueValue))
        return hex
    }
    
   
    func rgb2hsv(red: Float, grn: Float, blu: Float) -> [Float] {
        var hue: Float
        var sat: Float
        var val: Float
        var x: Float
        var f: Float
        var i: Float
        var result: [Float] = [0,0,0]
    
        x = min(red, grn, blu)
        val = max(red, grn, blu)
        
        if  x == val {
            hue = 0;
            sat = 0;
        }
        else {
            f = (red == x) ? grn-blu : ((grn == x) ? blu-red : red-grn)
            i = (red == x) ? 3 : ((grn == x) ? 5 : 1)
            hue = ((i-f/(val-x))*60).truncatingRemainder(dividingBy: Float(360))
            sat = ((val-x)/val)
        }
        result[0] = hue
        result[1] = sat
        result[2] = val/255
        return result
        
    }
}

