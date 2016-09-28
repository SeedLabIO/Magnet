//
//  AppDelegate.swift
//  Example
//
//  Created by 古林俊佑 on 2016/03/09.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import Magnet
import Carbon

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // ⌘ + Control + B
        guard let keyCombo = KeyCombo(keyCode: 11, carbonModifiers: 4352) else { return }
        let hotKey = HotKey(identifier: "CommandControlB",
                        keyCombo: keyCombo,
                        target: self,
                        action: #selector(AppDelegate.tappedHotKey))
        let _ = hotKey.register()

        // Shift + Control + A
        guard let keyCombo2 = KeyCombo(keyCode: 0, cocoaModifiers: [.shift, .control]) else { return }
        let hotKey2 = HotKey(identifier: "ShiftControlA",
                             keyCombo: keyCombo2,
                             target: self,
                             action: #selector(AppDelegate.tappedHotKey2))
        let _ = hotKey2.register()

        //　⌘　Double Tap
        guard let keyCombo3 = KeyCombo(doubledCocoaModifiers: .command) else { return }
        let hotKey3 = HotKey(identifier: "CommandDobuleTap",
                         keyCombo: keyCombo3,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleCommandKey))
        let _ = hotKey3.register()

        //　Shift　Double Tap
        guard let keyCombo4 = KeyCombo(doubledCocoaModifiers: .shift) else { return }
        let hotKey4 = HotKey(identifier: "ShiftDobuleTap",
                         keyCombo: keyCombo4,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleShiftKey))
        let _ = hotKey4.register()

        //　Control　Double Tap
        guard let keyCombo5 = KeyCombo(doubledCocoaModifiers: .control) else { return }
        let hotKey5 = HotKey(identifier: "ControlDobuleTap",
                         keyCombo: keyCombo5,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleControlKey))
        let _ = hotKey5.register()

        //　Option　Double Tap
        guard let keyCombo6 = KeyCombo(doubledCocoaModifiers: .option) else { return }
        let hotKey6 = HotKey(identifier: "AltDobuleTap",
                         keyCombo: keyCombo6,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleAltKey))
        let _ = hotKey6.register()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        HotKeyCenter.sharedCenter.unregisterAll()
    }

    func tappedHotKey() {
        print("hotKey!!!!")
    }

    func tappedHotKey2() {
        print("hotKey2!!!!")
    }

    func tappedDoubleCommandKey() {
        print("command double tapped!!!")
    }

    func tappedDoubleShiftKey() {
        print("shift double tapped!!!")
    }

    func tappedDoubleControlKey() {
        print("control double tapped!!!")
    }

    func tappedDoubleAltKey() {
        print("alt double tapped!!!")
    }
}

