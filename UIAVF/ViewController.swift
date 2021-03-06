//
//  ViewController.swift
//  UIAVF
//
//  Created by Adam Nemecek on 1/26/21.
//

import Cocoa
import AVFoundation
import CoreAudioKit

func load_plugin(name: String) {
    let a = AVAudioUnitComponentManager.shared().components(passingTest: {
        if $0.name.contains(name) {
            $1.pointee = true
            return true
        }
        else {
            return false
        }
    })
    
    let desc = a.first!.audioComponentDescription
    let instrument = AVAudioUnitMIDIInstrument(audioComponentDescription: desc)
    print("instrument \(instrument)")
    instrument.auAudioUnit.requestViewController(completionHandler: {
        print($0)
    })
}


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        load_plugin(name: "Sylenth")

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

