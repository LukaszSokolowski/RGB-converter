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
    
    @IBOutlet weak var colorPreView: UIView!
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var hexLabelDescription: UILabel!
 
    @IBOutlet var resultBackgroundView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var cmykDescriptionLabel: UILabel!
    @IBOutlet weak var cDescriptionLabel: UILabel!
    @IBOutlet weak var mDescriptionLabel: UILabel!
    @IBOutlet weak var yDescriptionLabel: UILabel!
    @IBOutlet weak var kDescriptionLabel: UILabel!
    
    @IBOutlet weak var cValueLabel: UILabel!
    @IBOutlet weak var mValueLabel: UILabel!
    @IBOutlet weak var yValueLabel: UILabel!
    @IBOutlet weak var kValueLabel: UILabel!
    
    @IBOutlet weak var hsvLabelDescription: UILabel!
    @IBOutlet weak var hLabelDescriptionHsv: UILabel!
    @IBOutlet weak var sLabelDescriptionHsv: UILabel!
    @IBOutlet weak var vLabelDescriptionHsv: UILabel!
    
    @IBOutlet weak var hLabelFromHsv: UILabel!
    @IBOutlet weak var sLabelFromHsv: UILabel!
    @IBOutlet weak var vLabelFromHsv: UILabel!
    
    @IBOutlet weak var hLabelFromHsl: UILabel!
    @IBOutlet weak var sLabelFromHsl: UILabel!
    @IBOutlet weak var lLabelFromHsl: UILabel!
    
    @IBOutlet weak var hslLabelDescription: UILabel!
    @IBOutlet weak var hLabelDescriptionHsl: UILabel!
    @IBOutlet weak var sLabelDescriptionHsl: UILabel!
    @IBOutlet weak var lLabelDescriptionHsl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStaticLabels()
        setRGBLabels()
        setBackground()
        setCmykLabels()
        setBackButton()
        setHexLabel()
        setHslLabels()
        setHsvLabels()
        rgb2cmyk()
        paintColorPreview()
        rgb2hsl()
        rgb2hsv()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setStaticLabels() {
        rLabel.text = "R:"
        gLabel.text = "G:"
        bLabel.text = "B:"
        
        rLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        gLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        bLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
    }
    func setBackButton() {
        backButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Boldq", size: 25)
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 7
    }
    func setRGBLabels() {
        
        rValueLabel.text = String(redValue)
        gValueLabel.text = String(greenValue)
        bValueLabel.text = String(blueValue)
        
        rValueLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        gValueLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        bValueLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
    }
    func setHexLabel() {
        hexLabel.text = "#" + rgb2hex()
        hexLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        hexLabelDescription.text = "HEX:"
        hexLabelDescription.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
    }
    func paintColorPreview() {
        let red = CGFloat(CGFloat(redValue)/255)
        let green = CGFloat(CGFloat(greenValue)/255)
        let blue = CGFloat(CGFloat(blueValue)/255)
 
        colorPreView.layer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
        colorPreView.layer.borderWidth = 2
        colorPreView.layer.cornerRadius = 15;
    }
    func setBackground() {
        resultBackgroundView.layer.cornerRadius = CGFloat(15);
        resultBackgroundView.layer.backgroundColor = UIColor(red: 1, green: 0.9333, blue: 0.6196, alpha: 1.0).cgColor
    }
    func setCmykLabels() {
        cmykDescriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        cDescriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        mDescriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        yDescriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        kDescriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        cValueLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        mValueLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        yValueLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        kValueLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
    }
    func setHsvLabels() {
        hsvLabelDescription.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        hLabelDescriptionHsv.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        sLabelDescriptionHsv.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        vLabelDescriptionHsv.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        
        hLabelFromHsv.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        sLabelFromHsv.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        vLabelFromHsv.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
    }
    func setHslLabels() {
        hLabelFromHsl.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        sLabelFromHsl.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        lLabelFromHsl.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        
        hslLabelDescription.font =  UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        hLabelDescriptionHsl.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        sLabelDescriptionHsl.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        lLabelDescriptionHsl.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
    }
    func rgb2cmyk() {
        let redNew = Float(Float(redValue)/255)
        let greenNew = Float(Float(greenValue)/255)
        let blueNew = Float(Float(blueValue)/255)
        
        let maxValueOfRGB = max(redNew, greenNew, blueNew)
        
        let K =  1 - maxValueOfRGB
        let C = (1 - redNew - K)/(1 - K)
        let M = (1 - greenNew - K)/(1 - K)
        let Y = (1 - blueNew - K)/(1 - K)
        
        cValueLabel.text = String(format: "%.3f",C)
        mValueLabel.text = String(format: "%.3f",M)
        yValueLabel.text = String(format: "%.3f",Y)
        kValueLabel.text = String(format: "%.3f",K)
    }
    
    func rgb2hex() -> String {
        let hex = String(format:"%02X", Int(redValue)) + String(format:"%02X", Int(greenValue)) + String(format:"%02X", Int(blueValue))
        return hex
    }
    func rgb2hsv() {
        let red = Float(redValue)
        let green = Float(greenValue)
        let blue = Float(blueValue)
        
        var hue: Float
        var saturation: Float
        var value: Float
        var x: Float
        var f: Float
        var i: Float
        x = min(red, green, blue)
        value = max(red, green, blue)
        
        if  x == value {
            hue = 0;
            saturation = 0;
        }
        else {
            f = (red == x) ? green-blue : ((green == x) ? blue-red : red-green)
            i = (red == x) ? 3 : ((green == x) ? 5 : 1)
            hue = ((i-f/(value-x))*60).truncatingRemainder(dividingBy: Float(360))
            saturation = ((value-x)/value)
        }
        hLabelFromHsv.text = String(format: "%.3f", hue)
        sLabelFromHsv.text = String(format: "%.4f", saturation)
        vLabelFromHsv.text = String(format: "%.4f",value/255)
    }
    
    func rgb2hsl() {
        let redConverted = max(min(Float64(redValue)/255, 1), 0)
        let greenConverted = max(min(Float64(greenValue)/255, 1), 0)
        let blueConverted = max(min(Float64(blueValue)/255, 1), 0)
        let maxValue = max(redConverted, greenConverted, blueConverted)
        let minValue = min(redConverted, greenConverted, blueConverted)
        let lightness = (maxValue + minValue) / 2
        var hue = 0.0, saturation = 0.0, difference = 0.0
        
        if maxValue != minValue {
            difference = maxValue - minValue
            if lightness > 0.5 {
                saturation = difference / (2 - maxValue - minValue)
            } else {
                saturation = difference / (maxValue + minValue)
            }
            if maxValue == redConverted {
                if greenConverted < blueConverted {
                    hue = (greenConverted - blueConverted) / difference + 6
                } else {
                    hue = (greenConverted - blueConverted) / difference
                }
            } else if maxValue == greenConverted {
                hue = (blueConverted - redConverted) / difference + 2
            } else {
                hue = (redConverted - greenConverted) / difference + 4
            }
        } else {
            hue = 0
            saturation = 0
        }
        hLabelFromHsl.text = String(Int(hue * 60))
        sLabelFromHsl.text = String(Int(saturation * 100))
        lLabelFromHsl.text = String(Int(lightness * 100))
    }
  
}

