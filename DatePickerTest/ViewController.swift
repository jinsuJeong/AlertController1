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
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss a EE"
        real.text = formatter.string(from: date)
        
        if(real.text==timeLabel.text)
        {
            view.backgroundColor=UIColor.red;
            
            let myAlert = UIAlertController(title: "알림", message: "설정된 시간이 되었습니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "종료", style: .default, handler: {(action:UIAlertAction) -> Void in
                self.view.backgroundColor=UIColor.yellow
            })
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {(action:UIAlertAction) -> Void in
                self.view.backgroundColor=UIColor.green
            })
            
            myAlert.addAction(okAction)
            myAlert.addAction(cancelAction)
            
            present(myAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func changeDatePicker(_ sender: Any) {
        print("change Date Picker");
        //print(myDatePicker.date)
        
        // dateFormat
        let formatter = DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm:ss a EE"
        timeLabel.text=formatter.string(from: myDatePicker.date)
        //timeLabel.text = String(describing: myDatePicker.date)
    }
    
}

