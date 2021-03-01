//
//  MyVstackView.swift
//  SwiftUI_tutorial
//
//  Created by 유준상 on 2021/03/01.
//

import Foundation
import SwiftUI

struct MyVstackView: View {
    var body: some View {
        VStack { // 중첩이 가능해짐, v: vertical, h: horizontal
            Text("1!")
                .padding()
                .font(.system(size: 50, weight: .bold, design: .monospaced))
            Text("2!")
                .padding()
                .font(.system(size: 50, weight: .bold, design: .monospaced))
            Text("3!")
                .padding()
                .font(.system(size: 50, weight: .bold, design: .monospaced))
        }
        .background(Color.red)
    }
}

// 보여주는 용도
struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
