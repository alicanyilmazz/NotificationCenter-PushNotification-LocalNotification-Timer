//
//  TimerViewController.swift
//  PushNotification
//
//  Created by alican on 24.11.2021.
//

import UIKit

class TimerViewController: UIViewController {
    
    var counter : Timer?
    var counter1 : Int = 1
    
    @IBOutlet weak var outputLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = ""
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startBtnClicked(_ sender: UIButton) {
        counter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(forwardCounter), userInfo: nil, repeats: true)
    }
    
    @objc func forwardCounter(){
        outputLbl.text = String(counter1)
        counter1 += 1
        
        if counter1 > 6{
            counter?.invalidate()
            outputLbl.text = "Time Ended."
            counter1 = 1
        }
    }
}
