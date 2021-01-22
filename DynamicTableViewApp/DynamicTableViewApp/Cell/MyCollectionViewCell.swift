//
//  MyCollectionViewCell.swift
//  DynamicTableViewApp
//
//  Created by 유준상 on 2021/01/17.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var profileLabel: UILabel!
    
    var imgName: String = "" {
        // 변수의 값이 변경될때 호출됨
        didSet {
            print("MyCollectionViewCell - imgName didSet called : \(imgName)")
            // cell의 UI설정
            self.profileImg.image = UIImage(systemName: imgName)
            self.profileLabel.text = imgName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyCollectionViewCell - awakeFromNib() called")
        self.contentView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
    
}
