//
//  ContentView.swift
//  SwiftUI_tutorial
//
//  Created by 유준상 on 2021/03/01.
//

import SwiftUI

struct ContentView: View {
    
    // @State 값이 변하면 다시 렌더링함, 값의 변화를 감지 -> 뷰에 적용
    @State private var isActivated: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    MyVstackView()
                    MyVstackView()
                    MyVstackView()
                
                } // 인스펙터를 통해 자동으로 코드가 변함
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                .onTapGesture {
                    // tap gesture 추가
                     print("HStack tapped")
                    
                    //애니메이션과 함께
                    withAnimation {
                        self.isActivated.toggle()
                        
                    }
                } // HStack
                
                // Navigation Button(링크)
                NavigationLink(destination: MyTextView()){
                    Text("네비게이션 버튼")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }.padding(.top, 30)
            }
        } // NavigationView
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
