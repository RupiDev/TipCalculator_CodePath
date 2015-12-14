//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Rupin Bhalla on 12/13/15.
//  Copyright © 2015 Rupin Bhalla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false);
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentIndex = defaults.integerForKey("defaultPercentage");
        
        tipControl.selectedSegmentIndex = percentIndex;
    }
    
    
    @IBAction func savePercentage(sender: AnyObject)
    {
        //var tipPercentages = [0.18, 0.2, 0.25];
        let defaults = NSUserDefaults.standardUserDefaults();
        let index = tipControl.selectedSegmentIndex;
        
        defaults.setInteger(index, forKey: "defaultPercentage");
        defaults.synchronize();
        
    }
    
    /*override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true);

    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
