//
//  QuestionViewController.swift
//  Wordlist
//
//  Created by Aoi Sakaue on 2016/02/12.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswered: Bool = false    //回答したか・次の問題に行くかの判定
    var wordArray: [AnyObject] = [] //ユーザーデフォルトからとる配列
    var shuffledWordArray: [AnyObject] = []
    var nowNumber: Int = 0  //現在の回答数
    
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(rand()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        wordArray = saveData.arrayForKey("WORD")!
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
    }
    
    
    
    
    @IBAction func nextButtonPushed() {
        
        //回答したか
        if isAnswered {
            //次の問題へ
            nowNumber++
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < shuffledWordArray.count  {
                //次の問題を表示
                questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
                //isAnsweredをfalseにする
                isAnswered = false
                //ボタンのタイトルを変更する
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
            }else{
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
        }else{
            //答えを表示する
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
            isAnswered = true
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
        }
    }
    
}


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


