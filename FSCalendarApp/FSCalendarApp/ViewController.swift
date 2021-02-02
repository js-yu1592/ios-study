//
//  ViewController.swift
//  FSCalendarApp
//
//  Created by 유준상 on 2021/02/02.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet var calendarView: FSCalendar!
    
    let dateFormatter = DateFormatter()
    
    let days = ["일", "월", "화", "수", "목", "금", "토"]
    
    var events: [Date] = [] // 이벤트 저장 배열
    
    override func loadView() {
        super.loadView()
    
        // 캘린더 뷰 설정
        calendarView.backgroundColor = .white
        calendarView.appearance.weekdayTextColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        calendarView.appearance.selectionColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        calendarView.appearance.todayColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        calendarView.appearance.titleTodayColor = .black
        calendarView.appearance.subtitleFont = UIFont.systemFont(ofSize: 30)
        calendarView.layer.cornerRadius = 20
        calendarView.locale = Locale(identifier: "ko_KR")
        for i in 0..<days.count {
            calendarView.calendarWeekdayView.weekdayLabels[i].text = days[i]
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // 캘린더 헤더 설정 변경
        calendarView.headerHeight = 50
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0 // 중간 헤더 외에 양 옆에 있는 년/월 지우기, 1로 설정시 진해짐
        calendarView.appearance.headerDateFormat = "YYYY년 M월"
        calendarView.appearance.headerTitleColor = .black
        calendarView.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        setUpEvents()
    }
    // 추석이나 크리스마스, 설날과 같은 이벤트를 저장하여 도트로 표시 -> 직접 다 해줘야하나..?
    func setUpEvents() {
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let xmas = dateFormatter.date(from: "2021-12-25")
        let sampledate = dateFormatter.date(from: "2021-02-11")
        events = [xmas!, sampledate!]
    }
    

}

extension ViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + "선택됨")
        
        // 선택이 되었을때 이벤트 설정(화면 이동)
        guard let dateVC = self.storyboard?.instantiateViewController(withIdentifier: "DateViewController") as? DateViewController else {
            return
        }
        dateVC.dateText = dateFormatter.string(from: date)
        self.present(dateVC, animated: true, completion: nil)
    }
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + "해제됨")
    }
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        // 해당 날짜 밑에 글자를 넣을 수 있음
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
            return "🐹"
        default:
            return nil
        }
    }
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        // 해당 날짜 숫자 대신 글자를 넣을 수 있음
        switch dateFormatter.string(from: date) {
        case "2021-02-04":
            return "D-DAY"
        default:
            return nil
        }
    }
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.events.contains(date) {
            return 1
        } else {
            return 0
        }
    }
    
}

extension ViewController: FSCalendarDataSource {
        
}
