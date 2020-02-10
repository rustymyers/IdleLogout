//
//  AppDelegate.swift
//  IdleLogout
//
//  Created by Myers, Russell on 11/12/19.
//  Copyright © 2019 Rusty Myers. All rights reserved.
//

import Cocoa
import SwiftUI

extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}

func setExitApp(newbool: Bool) {
    print("Setting exitApp to \(newbool)")
    exitApp = newbool
    if exitApp == true {
        exit(0)
    }
}

func testPrint(output: String) {
    print("received: \(output)")
}

//DispatchQueue.background(delay: 3.0, background: {
//    // do something in background
//}, completion: {
//    // when background job finishes, wait 3 seconds and do something in main thread
//})
//
//DispatchQueue.background(background: {
//    // do something in background
//}, completion:{
//    // when background job finished, do something in main thread
//})
//
//DispatchQueue.background(delay: 3.0, completion:{
//    // do something in main thread after 3 seconds
//})
var exitApp: Bool = false

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var idleLimit: Int = 10
    var lastEvent:CFTimeInterval = 0
    var myIdleTimer: idleTimer!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Idle Logout")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.setIsVisible(false) // Set window to hidden on start...
        myIdleTimer = idleTimer(contentWindow: contentView, window: window)
        
            
//            startIdleLoop()
//          killAll()
        
    }

//    func startIdleLoop() {
//            // https://stackoverflow.com/questions/24056205/how-to-use-background-thread-in-swift
//            DispatchQueue.background(background: {
//
//                    // do something in background
//                    // https://stackoverflow.com/questions/53559121/how-to-detect-user-inactivity-in-os-x-writing-in-swift-cocoa
//                    while Int(self.lastEvent) < self.idleLimit {
//                        self.lastEvent = CGEventSource.secondsSinceLastEventType(CGEventSourceStateID.hidSystemState, eventType: CGEventType(rawValue: ~0)!)
//                        print(self.lastEvent)
//                    }
//
//            }, completion:{
//                // when background job finished, do something in main thread
//                print("Completed Timer")
//                self.window.setIsVisible(true)
//            })
//    }
    func killAll() {
        print("killing and exiting all")
        
        exit(0)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    

}

