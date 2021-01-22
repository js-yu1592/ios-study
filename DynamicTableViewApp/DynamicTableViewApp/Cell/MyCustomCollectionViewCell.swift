//
//  MyCollectionViewCell.swift
//  DynamicTableViewApp
//
//  Created by 유준상 on 2021/01/17.
//

import Foundation
import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    
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
        self.contentView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    }
    
}
