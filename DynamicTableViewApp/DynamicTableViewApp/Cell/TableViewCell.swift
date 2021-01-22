//
//  TableViewCell.swift
//  DynamicTableViewApp
//
//  Created by 유준상 on 2021/01/07.
//
import UIKit
import Foundation

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userContentLabel: UILabel!
    
    
    
    // 셀이 랜더링(그릴 때) 될 때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("TableViewCell - awakeFromNib() called")
        
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width/2

        
    }
}
