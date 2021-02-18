//
//  ViewController.swift
//  BonMot
//
//  Created by 유준상 on 2020/02/18.
//

import UIKit
import BonMot

// 미리 스타일을 지정해서 설정할 수도 있음, 반복되는 폰트들이 많다면 활용하기 좋음
struct MyText {
    static let titleBold = StringStyle(
        .color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
        .font(UIFont(name: "BinggraeMelona-Bold", size: 25)!)
    )
    static let titleLight = StringStyle(
        .color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),
        .font(UIFont(name: "BinggraeMelona", size: 15)!)
    )
}


class ViewController: UIViewController {

    
    //MARK: - IBOutlets
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var fourthLabel: UILabel!
    @IBOutlet var fifthLabel: UILabel!
    @IBOutlet var sixthLabel: UILabel!
    @IBOutlet weak var seventhLabel: UILabel!
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setLabelStyle(with: "이것은 일반적인 방법으로 적용된 라벨 스타일 입니다.")
        self.setLabelStyleWithBonMot(with: "이것은 BonMot을 활용한 방법으로 적용된 라벨 스타일 입니다.")
        
        thirdLabel.attributedText = "따로 커스텀하여 라벨을 텍스트의 설정을 바꿀 수 있습니다.".styled(with: MyText.titleBold)
        
        fourthLabel.attributedText = "따로 커스텀하여 라벨을 텍스트의 설정을 바꿀 수 있습니다.".styled(with: MyText.titleLight)
        
        self.setLabelStyleDirectly()
        
        setLabelStyleMultiComposed()
        
        setLabelWithXMLStyle()
    }
    
    
    // MARK: - 일반적인 적용 방법
    // opt + cmd + left 코드 단위를 접어서 볼 수 있음
    fileprivate func setLabelStyle(with content: String){
        print("ViewController - setLabelStyle() called")
        
        let attributedString = NSMutableAttributedString(string: content)
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        
//        let font = UIFont.systemFont(ofSize: 72)
        let customFont = UIFont(name: "BinggraeMelona-Bold", size: 20)!
        let attributes: [NSAttributedString.Key: Any] = [
            .font: customFont,
            .foregroundColor: UIColor.red
        ]
        
        attributedString.addAttributes(attributes, range: NSMakeRange(0, attributedString.length))
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        
        
        firstLabel.attributedText = attributedString
        firstLabel.textColor = .black
    }

    
    // MARK: - BonMot을 적용한 방법
    // 기본적인 bonmot의 스타일 적용 방법
    fileprivate func setLabelStyleWithBonMot(with content: String) {
        print("ViewController - setLabelStyleWithBonMot() called")
        // 스트링 스타일 지정
        let style = StringStyle (
            .font(UIFont(name: "BinggraeMelona-Bold", size: 20)!),
            .lineSpacing(2),
            .color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        )
        // 스타일에 따로 추가할 수 있음
        let withBackgroundStyle = style.byAdding(.backgroundColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
        
        // 스타일이 지정된 attributedText를 가져옴
        secondLabel.attributedText = content.styled(with: withBackgroundStyle)
    }
    
    // 바로 글자 뒤에 스타일을 지정함으로써 코드의 길이를 줄일 수 있음
    fileprivate func setLabelStyleDirectly() {
        print("ViewController - setLabelStyleDirectly() called")
        fifthLabel.numberOfLines = 0
        fifthLabel.attributedText = "단어 단위로 나눠지는 글자 입니다. 스타일을 뒤에 붙여서 설정할 수도 있는것이에요 일반적인 방법으로 할때보다 훨씬 코드의 길이가 짧아집니다.".styled(with: .lineBreakMode(.byWordWrapping), .alignment(.center), .color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
    }

    // 하나의 라벨에 여러 스타일을 따로따로 적용시키고 싶을때 컴포즈해서 사용할 수 있음
    fileprivate func setLabelStyleMultiComposed() {
        let firstAttributedString = "이것은 첫번째".styled(with: .lineBreakMode(.byCharWrapping),.color(.brown),.backgroundColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        let secondAttributedString = "이건 두번째!".styled(with: MyText.titleBold)
        let thirdAttributedString = "이게 마지막 스트링입니다!!!".styled(with: MyText.titleLight)
        sixthLabel.attributedText = NSAttributedString.composed(of: [
            firstAttributedString, secondAttributedString, thirdAttributedString
        ])
    }
    
    // xml코드에 있는 글자가 있으면 그 글자에 대해서 스타일을 지정할 수 있음
    fileprivate func setLabelWithXMLStyle(){
        let string = "one fish, two fish, <red>이건 빨간 글씨입니다.</red>,<blue>이건 파란 글씨입니다.</blue><myCustomStyle>이것은 저의 커스텀 스타일입니다!!</myCustomStyle>"
        
        let redStyle = StringStyle(.lineBreakMode(.byCharWrapping),
                                   .color(.red),
                                   .backgroundColor(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        )
        let blueStyle = StringStyle(.underline(.single, #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),
                                   .color(.blue),
                                   .backgroundColor(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        )
        let completeStyle = StringStyle(
            .font(UIFont.systemFont(ofSize: 20)),
            .lineSpacing(2),
            .xmlRules([
                .style("red", redStyle),
                .style("blue", blueStyle),
                .style("myCustomStyle", MyText.titleBold)
            ])
        )
        seventhLabel.attributedText = string.styled(with: completeStyle)
    }
}

