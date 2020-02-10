//
//  CountDownView.swift
//  IdleLogout
//
//  Created by Myers, Russell on 11/12/19.
//  Copyright © 2019 Rusty Myers. All rights reserved.
//

import SwiftUI

struct CountDownView : View {
    var referenceDate: Date
    @State var timeRemaining: Int
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
            
        }
    }
    @State private var nowDate: Date = Date()

    var body: some View {
        HStack {
            Text("Time remaining: ")
                .font(.largeTitle)
            Text(countDownString(from: referenceDate))
                .font(.largeTitle)
                .onAppear(perform: {
                    _ = self.timer
                })
            }
    }

    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.minute, .second],
                            from: nowDate,
                            to: referenceDate.addingTimeInterval(TimeInterval(timeRemaining)))
        if components.minute ?? 00 <= 0 && components.second ?? 00 <= 0 {
            timer.invalidate()
            print("User has run out of time")
            setExitApp(newbool: true)
            return String("...Logging Out!")
        }
        return String(format: "%02dm:%02ds",
                      components.minute ?? 00,
                      components.second ?? 00)
        
    }

}
struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView(referenceDate: Date(), timeRemaining: 5)
    }
}
