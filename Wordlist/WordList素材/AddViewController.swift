//
//  AddViewController.swift
//  Wordlist
//
//  Created by Aoi Sakaue on 2016/02/12.
//  Copyright © 2016年 Aoi Sakaue. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }

    
    

    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!,"japanese": japaneseTextField.text!]
        
        if englishTextField.text == "" || japaneseTextField.text == "" {
            let alert = UIAlertController(
                title: "保存失敗",
                message: "テキスト入力欄に入力してください",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: nil
                )
            )
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
            wordArray.append(wordDictionary)
            saveData.setObject(wordArray, forKey: "WORD")
            
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました",
                preferredStyle:  UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: nil
                )
            )
            self.presentViewController(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}