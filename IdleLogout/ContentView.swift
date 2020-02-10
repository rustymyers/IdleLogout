//
//  ContentView.swift
//  IdleLogout
//
//  Created by Myers, Russell on 11/12/19.
//  Copyright © 2019 Rusty Myers. All rights reserved.
//

import SwiftUI
import CoreImage

struct ContentView: View {
    
    @State var totalClicked: Int = 0
    @State private var selectedTime = 0
    @State var timeRemaining: Int = 20
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                CircleImage().frame(width: 100, height: 110)
                Text("This system has detectd idle input past the permitted time. Please request additional time or log out...")
                .frame(minWidth: 200, maxWidth: 300, minHeight: 100, maxHeight: 200)
            }
            VStack(alignment: .center) {
                
                    
                MoreTimeBarItems(timeRemaining: timeRemaining)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .listStyle(DefaultListStyle())
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
