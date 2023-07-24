//
//  NewlyWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 마르 on 2023/07/21.
//

import UIKit

class NewlyWordViewController: UIViewController {
    
    var wordDictionary : [String: String] =
    ["알잘딱깔센": "알아서 잘 딱 깔끔하게 센스있게",
     "오저치고": "오늘 저녁 치킨 고",
     "별다줄": "별걸 다 줄인다",
     "금사빠": "금방 사랑에 빠지는",
     "TMT": "투머치토커; 말이 많은 사람",
     "JMT": "매우 맛있다"
    ]
    
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var searchButtonImage: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultImageView: UIImageView!
    
    @IBOutlet var word3: UIButton!
    @IBOutlet var word2: UIButton!
    @IBOutlet var word1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageView()
        designSearchButton()
        designTextField()
        
        setWords(word1)
        setWords(word2)
        setWords(word3)
        
    }
    
    // 1. 버튼 클릭
    @IBAction func wordButtonCliked(_ sender: UIButton) {
        //print(sender.currentTitle)
        //print(sender.textLabel?.text)
        //2. 텍스트필드에 내용 띄우기
        wordTextField.text = sender.currentTitle
        //3. 레이블에 내용 띄우기
        textFieldClicked(wordTextField)
    }
    
    @IBAction func textFieldClicked(_ sender: UITextField) {
        //print("DidEndOnExit") // 엔터키 눌럿을 때
        
        if (wordDictionary.keys.contains(sender.text!.uppercased())) {
            resultLabel.text = wordDictionary[sender.text!.uppercased()]
        } else {
            resultLabel.text = "찾으시는 결과가 없습니다."
        }
            
        resultLabel.textAlignment = .center
    }
    
    
    func designSearchButton(){
        searchButtonImage.image = UIImage(systemName: "magnifyingglass.circle.fill")
        searchButtonImage.tintColor = .black
        searchButtonImage.backgroundColor = .white
    }
    
    var usedWords : [String] = []
    func setWords(_ wordButton: UIButton){
        
        wordButton.backgroundColor = .white
        wordButton.layer.borderWidth = 2
        wordButton.layer.borderColor = UIColor.black.cgColor
        wordButton.titleLabel?.tintColor = .black
        wordButton.layer.cornerRadius = 10
        
        var randomWord = wordDictionary.randomElement()?.key
        
        while (true){
            if usedWords.contains(randomWord!) {
                randomWord = wordDictionary.randomElement()?.key
            } else {
                usedWords.append(randomWord!)
                wordButton.setTitle(randomWord, for: .normal)
                return
            }
        }
    }
    
    func setImageView(){
        resultImageView.image = UIImage(named: "background")
    }
    
    func designTextField(){
        wordTextField.placeholder = "궁금하신 신조어를 검색해보세요!"
        wordTextField.layer.borderColor = UIColor.black.cgColor
        wordTextField.layer.borderWidth = 1
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        textFieldClicked(wordTextField)
    }
    
}
