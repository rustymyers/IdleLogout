//
//  idleTimer.swift
//  IdleLogout
//
//  Created by Myers, Russell on 11/12/19.
//  Copyright © 2019 Rusty Myers. All rights reserved.
//

import Foundation
import Cocoa
import SwiftUI

func restartIdleTimer() {
    
}

var sleepTime: String = ""

func setSleepApp(newsleepTime: String) -> Void {
    sleepTime = newsleepTime
    print("setSleepApp got \(sleepTime)")
}


func getSleepApp() -> String {
    print("getSleepApp sent \(sleepTime)")
    return sleepTime
}


class idleTimer {
    let idleLimit: Int = 10
    var lastEvent:CFTimeInterval = 0
    var contentWindow: ContentView
    var window: NSWindow
    
    init(contentWindow: ContentView, window: NSWindow) {
        self.contentWindow = contentWindow
        self.window = window
        startTimer()
//        while exitApp == false {
//            print("waiting to do something....")
//            sleep(5)
//        }
    }
    
    func startTimer() {
        setExitApp(newbool: false)
        
        // https://stackoverflow.com/questions/24056205/how-to-use-background-thread-in-swift
        DispatchQueue.background(background: {
            // do something in background
            // https://stackoverflow.com/questions/53559121/how-to-detect-user-inactivity-in-os-x-writing-in-swift-cocoa
            while Int(self.lastEvent) < self.idleLimit {
                self.lastEvent = CGEventSource.secondsSinceLastEventType(CGEventSourceStateID.hidSystemState, eventType: CGEventType(rawValue: ~0)!)
                print(self.lastEvent)
//                sleep(0.5)
            }
        }, completion:{
            // when background job finished, do something in main thread
            print("Completed Timer")
            self.window.setIsVisible(true)
            
        })
    }
}
