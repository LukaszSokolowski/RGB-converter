//
//  ViewController.swift
//  ColorZ
//
//  Created by Łukasz Sokołowski on 15/11/2018.
//  Copyright © 2018 Łukasz Sokołowski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var redTextFieldInput: UITextField!
    @IBOutlet weak var greenTextFieldInput: UITextField!
    @IBOutlet weak var blueTextFieldInput: UITextField!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var validateLabel: UILabel!
    
    @IBOutlet weak var convertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextFieldInput.delegate = self
        greenTextFieldInput.delegate = self
        blueTextFieldInput.delegate = self
        
        setInfoLabel()
        setAllFonts()
        setBackgroundView()
        setTextField()
        setConvertButton()
        
        validateLabel.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        if (redTextFieldInput.text?.isEmpty)! || (greenTextFieldInput.text?.isEmpty)! || (blueTextFieldInput.text?.isEmpty)! {
            showEmptyLabelAlert()
        }
        else {
            validateLabel.isHidden = true
            self.performSegue(withIdentifier: "segueToNext", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToNext" {
            if let secondVC = segue.destination as? ResultsViewController {
                secondVC.redValue = Int(redTextFieldInput.text!)!
                secondVC.greenValue = Int(greenTextFieldInput.text!)!
                secondVC.blueValue = Int(blueTextFieldInput.text!)!
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    }
    func setTextField() {
        
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
    func setValidateLabel() {
        validateLabel.text = "Uzupełnij wszystkie pola!"
        validateLabel.font = UIFont(name: "Futura-Medium", size: 20)
    }
    func showEmptyLabelAlert() {
       setValidateLabel()
       validateLabel.isHidden = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 3
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
   
}

