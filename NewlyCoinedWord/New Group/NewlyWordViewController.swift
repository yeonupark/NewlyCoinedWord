//
//  NewlyWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 마르 on 2023/07/21.
//

import UIKit

class NewlyWordViewController: UIViewController {
    enum NewlyWord: String, CaseIterable {
        case 알잘딱깔센 = "알아서 잘 딱 깔끔하게 센스있게"
        case 오저치고 = "오늘 저녁 치킨 고"
        case 별다줄 = "별걸 다 줄인다"
        case 금사빠 = "금방 사랑에 빠지는"
        case TMT = "투머치토커; 말이 많은 사람"
        case JMT = "매우 맛있다"
        case 롬곡옾높 = "폭풍눈물"
        case 만반잘부 = "만나서 반가워 잘 부탁해"
        case 많관부 = "많은 관심 부탁"
        case 좋댓구알 = "좋아요 댓글 구독 알림설정"
        
        var word: String{
            String(describing: self)
        }
    }
    
    
    let keywords = NewlyWord.allCases
    
//    var wordDictionary : [String: String] =
//    ["알잘딱깔센": "알아서 잘 딱 깔끔하게 센스있게",
//     "오저치고": "오늘 저녁 치킨 고",
//     "별다줄": "별걸 다 줄인다",
//     "금사빠": "금방 사랑에 빠지는",
//     "TMT": "투머치토커; 말이 많은 사람",
//     "JMT": "매우 맛있다",
//     "롬곡옾높": "폭풍눈물",
//     "만반잘부": "만나서 반가워 잘 부탁해",
//     "많관부": "많은 관심 부탁",
//     "좋댓구알": "좋아요 댓글 구독 알림설정"
//    ]
    
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
        
        designWordButton(word1)
        designWordButton(word2)
        designWordButton(word3)
        showRandomWord()
    }
    
    // 1. 버튼 클릭
    @IBAction func wordButtonCliked(_ sender: UIButton) {
        
        //2. 텍스트필드에 내용 띄우기
        wordTextField.text = sender.currentTitle
        //3. 레이블에 내용 띄우기
        textFieldClicked(wordTextField)
        
        view.endEditing(true)
    }
    
    @IBAction func textFieldClicked(_ sender: UITextField) {
        //print("DidEndOnExit") // 엔터키 눌럿을 때
        
//        if let text = sender.text {
//            if (text.count < 2){
//                showAlert()
//            }
//            else if (wordDictionary.keys.contains(text.uppercased())) {
//                resultLabel.text = wordDictionary[text.uppercased()]
//            } else {
//                resultLabel.text = "찾으시는 결과가 없습니다."
//            }
//        }
        
        guard var text = sender.text else {
            print("오류 발생")
            return
        }
        
        text = text.trimmingCharacters(in: .whitespaces)
        
        if (text.count == 0){
            showAlert(0)
            return
        } else if (text.count == 1){
            showAlert(1)
            return
        }
        
        let answer: String
        
        switch text.uppercased() {
        case keywords[0].word: answer =  NewlyWord.알잘딱깔센.rawValue
        case keywords[1].word: answer =  NewlyWord.오저치고.rawValue
        case keywords[2].word: answer =  NewlyWord.별다줄.rawValue
        case keywords[3].word: answer =  NewlyWord.금사빠.rawValue
        case keywords[4].word: answer =  NewlyWord.TMT.rawValue
        case keywords[5].word: answer =  NewlyWord.JMT.rawValue
        case keywords[6].word: answer =  NewlyWord.롬곡옾높.rawValue
        case keywords[7].word: answer =  NewlyWord.만반잘부.rawValue
        case keywords[8].word: answer =  NewlyWord.많관부.rawValue
        case keywords[9].word: answer =  NewlyWord.좋댓구알.rawValue
        default: answer = "찾으시는 결과가 없습니다."
        }
        
        resultLabel.text = answer
        resultLabel.textAlignment = .center
            
    }
    
    
    func designSearchButton(){
        searchButtonImage.image = UIImage(systemName: "magnifyingglass.circle.fill")
        searchButtonImage.tintColor = .black
        searchButtonImage.backgroundColor = .white
    }
    
    func designWordButton(_ wordButton: UIButton){
        
        wordButton.backgroundColor = .white
        wordButton.layer.borderWidth = 2
        wordButton.layer.borderColor = UIColor.black.cgColor
        wordButton.layer.cornerRadius = 10
        
        //wordButton.titleLabel?.tintColor = .black
        if let title = wordButton.titleLabel {
            title.tintColor = .black
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
    
    func showRandomWord(){
//        let shuffledDict = wordDictionary.shuffled()
////        print(wordDictionary)
////        print(shuffledDict[0].key)
//        word1.setTitle(shuffledDict[word1.tag].key, for: .normal)
//        word2.setTitle(shuffledDict[word2.tag].key, for: .normal)
//        word3.setTitle(shuffledDict[word3.tag].key, for: .normal)
        
        let shuffledWords = keywords.shuffled()
        word1.setTitle(shuffledWords[0].word, for: .normal)
        word2.setTitle(shuffledWords[1].word, for: .normal)
        word3.setTitle(shuffledWords[2].word, for: .normal)
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        textFieldClicked(wordTextField)
        view.endEditing(true)
    }
    
    func showAlert(_ ver: Int) {
        
        let sentence: String
        
        switch ver{
        case 0: sentence = "내용을 입력해주세요!"
        case 1: sentence = "두글자 이상 작성해주세요!"
        default: sentence = "오류가 발생했습니다."
        }
        
        let alert = UIAlertController(title: sentence, message: "😛", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
