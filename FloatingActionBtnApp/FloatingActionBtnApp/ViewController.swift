//
//  ViewController.swift
//  FloatingActionBtnApp
//
//  Created by 유준상 on 2020/12/21.
//

import UIKit
import JJFloatingActionButton

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let actionButton = JJFloatingActionButton()
        
        actionButton.buttonColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)

        actionButton.addItem(title: "좋아요", image: UIImage(systemName: "hand.thumbsup.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          print("item1 clicked")
            self.titleLabel.text = "좋아요 👍🏻"
        }

        actionButton.addItem(title: "하트", image: UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            print("item2 clicked")
            self.titleLabel.text = "하트 ❤️"
        }

        actionButton.addItem(title: "휴지통", image: UIImage(systemName: "trash.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            print("item3 clicked")
            self.titleLabel.text = "휴지통 💩"
        }

//        view.addSubview(actionButton)
//        actionButton.translatesAutoresizingMaskIntoConstraints = false
//        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
//        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        // 위 결과와 같은 한줄
        actionButton.display(inViewController: self)
        
        let secondActionButton = JJFloatingActionButton()
        
        secondActionButton.buttonColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)

        secondActionButton.addItem(title: "", image: nil) { item in
            print("item1 clicked")
//            self.titleLabel.text = "좋아요 👍🏻"
            let alertController = UIAlertController(title: "작성", message: "작성 해주세요", preferredStyle: .alert)
            alertController.addTextField()
            
            let submitBtnAction = UIAlertAction(title: "완료", style: .default, handler: {action in
                let textField = alertController.textFields![0]
                
//                guard let userInputText = textField.text else {
//                    print("값이 없다 👻")
//                    return
//                }
                if textField.text == "" {
                    self.titleLabel.text = "값이 없다 👻"
                }else {
                    self.titleLabel.text = textField.text
                }
            })
            alertController.addAction(submitBtnAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        view.addSubview(secondActionButton)
        secondActionButton.translatesAutoresizingMaskIntoConstraints = false
        
        secondActionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        secondActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true


    }


}

