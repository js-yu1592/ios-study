//
//  ContentView.swift
//  SwiftUI_tutorial
//
//  Created by 유준상 on 2021/03/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            MyVstackView()
            MyVstackView()
            MyVstackView()
        
        } // 인스펙터를 통해 자동으로 코드가 변함
        .padding(30)
        .background(Color.yellow)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
