//
//  ViewController.swift
//  ColorZ
//
//  Created by Łukasz Sokołowski on 15/11/2018.
//  Copyright © 2018 Łukasz Sokołowski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    var redValueToPass:   Int = 0
    var greenValueToPass: Int = 0
    var blueValueToPass:  Int = 0
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var redTextFieldInput: UITextField!
    @IBOutlet weak var greenTextFieldInput: UITextField!
    @IBOutlet weak var blueTextFieldInput: UITextField!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var convertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextFieldInput.delegate = self
        greenTextFieldInput.delegate = self
        blueTextFieldInput.delegate = self
        
        setInfoLabel()
        setAllFonts()
        setBackgroundView()
        setTextView()
        setConvertButton()
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func redTextFieldAction(_ redField: UITextField) {
        if let redUserValue: Int = Int(redField.text!)
        {
            redValueToPass = redUserValue
            print("\(greenValueToPass)")
        }
    }
    @IBAction func greenTextFieldAction(_ greenField: UITextField) {
        if let greenUserValue: Int = Int(greenField.text!)
        {
            greenValueToPass = greenUserValue
            print("\(greenValueToPass)")
        }
    }
    @IBAction func blueTextFieldAction(_ blueField: UITextField) {
        if let blueUserValue: Int = Int(blueField.text!)
        {
            blueValueToPass = blueUserValue
            print("\(blueValueToPass)")
        }
    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
       self.performSegue(withIdentifier: "segueToNext", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToNext" {
            if let destination = segue.destination as? ResultsViewController {
                let secondVC = destination
                secondVC.redValue = redValueToPass
                secondVC.greenValue = greenValueToPass
                secondVC.blueValue = blueValueToPass
            }
        }
    }
    
    
    func setAllFonts() {
         redLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
         greenLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
         blueLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
    }
    func setInfoLabel() {
        infoLabel.layer.shadowColor = UIColor.black.cgColor
        infoLabel.layer.shadowRadius = 3.0
        infoLabel.layer.shadowOpacity = 1.0
        infoLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        infoLabel.layer.masksToBounds = false
        
        infoLabel.text = "RGB converter"
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont(name: "Verdana", size: 40)
    }
    func setBackgroundView() {
        backgroundView.layer.cornerRadius = CGFloat(15);
        backgroundView.layer.backgroundColor = UIColor(red: 1, green: 0.9333, blue: 0.6196, alpha: 1.0).cgColor
        
        //Czemu to przykrywa muj widog
        //let gradient = CAGradientLayer() // Line 1
        //gradient.frame = backgroundView.bounds // Line 2
        //gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor] // Line 3
        //backgroundView.layer.addSublayer(gradient) // Line 4
    }
    func setTextView() {
        redTextFieldInput.keyboardType = .numberPad
        redTextFieldInput.font = UIFont(name: "Verdana", size: 30)
        
        greenTextFieldInput.keyboardType = .numberPad
        greenTextFieldInput.font = UIFont(name: "Verdana", size: 30)
        
        blueTextFieldInput.keyboardType = .numberPad
        blueTextFieldInput.font = UIFont(name: "Verdana", size: 30)
    }
    func setConvertButton() {
        convertButton.setTitle("Konwertuj", for: .normal)
        convertButton.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 50)
        convertButton.setTitleColor(.black, for: .normal)
        convertButton.setTitleShadowColor(.red, for: .normal)
        convertButton.layer.borderWidth = 1;
        convertButton.layer.cornerRadius = 15;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 3
    }
   
}

