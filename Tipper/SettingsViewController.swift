//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Sonali Gupta on 12/31/15.
//  Copyright © 2015 Shefali. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipSetting(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        if (sender.selectedSegmentIndex == 0) {
            defaults.setDouble(0.15, forKey: "default_tip_percentage")
        }
        
        else if (sender.selectedSegmentIndex == 1) {
            defaults.setDouble(0.2, forKey: "default_tip_percentage")
        }
        
        else {
            defaults.setDouble(0.25, forKey: "default_tip_percentage")
        }
        defaults.synchronize()
        print("set default tip percentage")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
