//
//  ViewController.swift
//  Tipper
//
//  Created by Sonali Gupta on 12/29/15.
//  Copyright © 2015 Shefali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var dividerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00";
        self.title = "Tip Calculator";
        billField.becomeFirstResponder();
        
        //let lightPlumColor = UIColor(netHex: 0x59323C);
        //self.view.backgroundColor = lightPlumColor;
        //let parchmentColor = UIColor(netHex: 0xF2EEB3);
        //dividerView.backgroundColor = parchmentColor;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.2, 0.25];
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex];
        let billAmount = NSString(string: billField.text!).doubleValue;
        let tip = billAmount * tipPercentage;
        let total = billAmount + tip;
        
        tipLabel.text = "\(tip)";
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total);
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount

    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
}



//make a UIColor from a hex string
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "invalid red component")
        assert(green >= 0 && green <= 255, "invalid green component")
        assert(blue >= 0 && blue <= 255, "invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

