//
//  ViewController.swift
//  DatePickerTest
//
//  Created by D7703_18 on 2018. 4. 11..
//  Copyright © 2018년 D7703_18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var real: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime(){
        let date=Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "현재시간:yyyy-MM-dd HH:mm:ss a EE"
        real.text = formatter.string(from: date)
    }
    
    @IBAction func changeDatePicker(_ sender: Any) {
        print("change Date Picker");
        //print(myDatePicker.date)
        
        // dateFormat
        let formatter = DateFormatter()
        formatter.dateFormat="선택시간:yyyy-MM-dd HH:mm:ss a EE"
        timeLabel.text=formatter.string(from: myDatePicker.date)
        //timeLabel.text = String(describing: myDatePicker.date)
    }
    
}

