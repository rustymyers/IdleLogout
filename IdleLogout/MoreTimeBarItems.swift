//
//  MoreTimeBarItems.swift
//  IdleLogout
//
//  Created by Myers, Russell on 11/12/19.
//  Copyright © 2019 Rusty Myers. All rights reserved.
//

import SwiftUI

struct MoreTimeBarItems: View {
    var times = ["...Select More Time","15", "30", "60", "120"]
    @State private var selectedTime = 0
    @State public var totalClicked = 0
    @State public var moreTimeString = ""
    var timeRemaining: Int
    var timeFormat: String = "Minutes"
    // https://medium.com/better-programming/make-a-simple-countdown-with-timer-and-swiftui-3ce355b54986
    let referenceDate: Date = Date()

    var body: some View {
        VStack {
            HStack {
                Picker(selection: $selectedTime, label: Text("Request more time: ")) {
                    ForEach(0 ..< self.times.count) {
                    Text("\(self.times[$0]) \(self.timeFormat)")
                    
                }.layoutPriority(0.0)
//                .onReceive($selectedTime, perform: {selectedTime in testPrint(output: self.times[selectedTime])})
                        //.onReceive($selectedTime) { selectedTime in self.moreTimeString = selectedTime}
                        
                //setSleepApp(newsleepTime: times[selectedTime])
                
            }.padding(.trailing, 10).frame(width: 360)
            
            Button(action: {setExitApp(newbool: true)}) {
                Text("Log Out Now!")
            }
        }
//            Text("Time remaining: \(timeRemaining)").font(.subheadline)
//            Text("Date: \(referenceDate)").font(.subheadline)
//            Text("Date Plus Time: \(referenceDate.addingTimeInterval(TimeInterval(timeRemaining)))").font(.subheadline)
        
        Text("Time selected: \(times[selectedTime])")
            
        CountDownView(referenceDate: referenceDate, timeRemaining: timeRemaining)
        }.padding()
    }
}

struct MoreTimeBarItems_Previews: PreviewProvider {
    static var previews: some View {
        MoreTimeBarItems(timeRemaining: 15)
    }
}
