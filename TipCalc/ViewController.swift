//
//  ViewController.swift
//  TipCalc
//
//  Created by Rupin Bhalla on 12/6/15.
//  Copyright © 2015 Rupin Bhalla. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    
    @IBOutlet weak var onePersonTipLabel: UILabel!
    @IBOutlet weak var secondPersonTipLabel: UILabel!
    @IBOutlet weak var thirdPersonTipLabel: UILabel!
    @IBOutlet weak var fourthPersonTipLabel: UILabel!
    
    var tipPercentage = 0.00;

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00";
        onePersonTipLabel.text = "$0.00";
        secondPersonTipLabel.text = "$0.00";
        thirdPersonTipLabel.text = "$0.00";
        fourthPersonTipLabel.text = "$0.00";
        

        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated);
        print("view will appear");
        self.navigationController?.setNavigationBarHidden(true, animated: true);
        
        let defaults = NSUserDefaults.standardUserDefaults();
        let indexPercent = defaults.integerForKey("defaultPercentage");
        
        tipControl.selectedSegmentIndex = indexPercent;
        
        

    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        print("view did appear");
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated);
        print("view will disappear");
    }
    
    override func viewDidDisappear(animated: Bool)
    {
        super.viewDidDisappear(animated)
        print("view did disappear");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject)
    {
        
        var tipPercentages = [0.18, 0.2, 0.25];
        
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex];

        
        let billAmount = NSString(string: billField.text!).doubleValue;
        let tip = billAmount * tipPercentage;
        let total = billAmount + tip;
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)";
        
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "%.2f", total);
        
        onePersonTipLabel.text = "$\(total)";
        secondPersonTipLabel.text = "$\(total/2)";
        thirdPersonTipLabel.text = "$\(total/3)";
        fourthPersonTipLabel.text = "$\(total/4)";
        
        onePersonTipLabel.text = String(format: "$%.2f", total);
        secondPersonTipLabel.text = String(format: "$%.2f", total/2);
        thirdPersonTipLabel.text = String(format: "$%.2f", total/3);
        fourthPersonTipLabel.text = String(format: "$%.2f", total/4);
        
        
    }

    @IBAction func onTap(sender: AnyObject)
    {
        view.endEditing(true) // tapping anywhere will remove the keyboard.
    }




}

