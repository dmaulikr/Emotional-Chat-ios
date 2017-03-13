//
//  ViewController.swift
//  Client_test
//
//  Created by Hirano on 2017/03/02.
//  Copyright © 2017年 Oyama. All rights reserved.
//

import UIKit
import SwiftSocket
import SwiftyJSON
import NextGrowingTextView
import JSQMessagesViewController

class ViewController: UIViewController {
    
    let host = "localhost"
    let port: Int32 = 8083
    let userName = "Oyama"
    var client: JSONSocket!
    
    @IBOutlet weak var inputTextView: UIView!
    @IBOutlet weak var inputTextViewBottom: NSLayoutConstraint!
    @IBOutlet weak var inputText: NextGrowingTextView!
    
    @IBOutlet weak var sendTextView: UITextView!
    @IBOutlet weak var receiveTextView: UITextView!
    
    @IBAction func connectToServer(_ sender: Any) {
        if client.connect() == true {
            client.receive(view: receiveTextView)
        }
    }
    
    @IBAction func sendText(_ sender: Any) {
        client.send(text: inputText.text, view: sendTextView)
        inputText.text = ""
        view.endEditing(true)
    }
    
    @IBAction func endConnection(_ sender: Any) {
        client.close()
        print("End connect")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        client = JSONSocket(username: userName, address: host, port: port)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        inputText.layer.cornerRadius = 8
        inputText.backgroundColor = UIColor(white: 0.9, alpha: 1)
        inputText.textContainerInset = UIEdgeInsets(top: 16, left: 0, bottom: 4, right: 0)
        inputText.placeholderAttributedText = NSAttributedString(string: "テキストを入力してください",attributes: [NSFontAttributeName: self.inputText.font!,NSForegroundColorAttributeName: UIColor.gray])
        
        // textView編集不可
        sendTextView.isEditable = false
        receiveTextView.isEditable = false
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func keyboardWillHide(_ sender: Notification) {
        if let userInfo = (sender as NSNotification).userInfo {
            if let _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
                //key point 0,
                self.inputTextViewBottom.constant =  0
                //textViewBottomConstraint.constant = keyboardHeight
                UIView.animate(withDuration: 0.25, animations: { () -> Void in self.view.layoutIfNeeded() })
            }
        }
    }
    func keyboardWillShow(_ sender: Notification) {
        if let userInfo = (sender as NSNotification).userInfo {
            if let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
                self.inputTextViewBottom.constant = keyboardHeight
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
}
