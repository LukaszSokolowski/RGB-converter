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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStaticLabels()
      
        rValueLabel.text = String(redValue)
        gValueLabel.text = String(greenValue)
        bValueLabel.text = String(blueValue)
       
    }
    
    func setStaticLabels() {
        rLabel.text = "R:"
        gLabel.text = "G:"
        bLabel.text = "B:"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
