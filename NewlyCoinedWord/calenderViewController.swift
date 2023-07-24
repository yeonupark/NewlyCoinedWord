//
//  calenderViewController.swift
//  NewlyCoinedWord
//
//  Created by 마르 on 2023/07/20.
//

import UIKit

class CalenderViewController: UIViewController {
    
    @IBOutlet var label100: UILabel!
    @IBOutlet var label300: UILabel!
    @IBOutlet var label500: UILabel!
    @IBOutlet var label1000: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var backGround100ImageView: UIImageView!
    @IBOutlet var backGround300ImageView: UIImageView!
    @IBOutlet var backGround500ImageView: UIImageView!
    @IBOutlet var backGround1000ImageView: UIImageView!
    
    @IBOutlet var date100Label: UILabel!
    @IBOutlet var date300Label: UILabel!
    @IBOutlet var date500Label: UILabel!
    @IBOutlet var date1000Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designBackgroundView(backGround100ImageView, name: "100")
        designBackgroundView(backGround300ImageView, name: "300")
        designBackgroundView(backGround500ImageView, name: "500")
        designBackgroundView(backGround1000ImageView, name: "1000")
        
        designLabel(date100Label)
        designLabel(date500Label)
        designLabel(date300Label)
        designLabel(date1000Label)
        
        setLabels()
        designDatePicker()
        datePicked(datePicker) // 클릭하지 않아도 액션을 실행시킴 ! (액션 수동 구현)
    }
  
    @IBAction func datePicked(_ sender: UIDatePicker) {
        //print(datePicker.date)
        //print(sender.date)
        
        let result100 = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
        let result300 = Calendar.current.date(byAdding: .day, value: 300, to: sender.date)
        let result500 = Calendar.current.date(byAdding: .day, value: 500, to: sender.date)
        let result1000 = Calendar.current.date(byAdding: .day, value: 1000, to: sender.date)
        
        //DateFormatter: 1. 디바이스에 설정된 국가 기반으로 시간대 변경 2. 날짜 포맷 변경
        let format = DateFormatter()
        format.dateFormat = "yyyy.MM.dd"
    
        date100Label.text = format.string(from: result100!)
        date300Label.text = format.string(from: result300!)
        date500Label.text = format.string(from: result500!)
        date1000Label.text = format.string(from: result1000!)
        
    }
    
    func designBackgroundView(_ background: UIImageView, name: String){
        background.image = UIImage(named: name)
        background.layer.opacity = 0.8
        //background.clipsToBounds = true
        background.layer.cornerRadius = 30
        background.contentMode = .scaleToFill
        
        // 그림자코드
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOffset = CGSize(width: 10, height: 10) // .zero == CGSize(width:0, height: 0)
        background.layer.shadowRadius = 10
        background.layer.shadowOpacity = 0.5
        background.clipsToBounds = false
        
    }
    
    func designLabel(_ label: UILabel){
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
    }
    
    func designDatePicker(){
        
        datePicker.tintColor = .systemPink
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    func setLabels(){
        label100.text = "+100"
        label300.text = "+300"
        label500.text = "+500"
        label1000.text = "+1000"
        
        label100.textColor = .systemPink
        label300.textColor = .systemPink
        label500.textColor = .systemPink
        label1000.textColor = .systemPink
    }
    
}
