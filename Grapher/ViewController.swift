//
//  ViewController.swift
//  Grapher
//
//  Created by Graem Sheppard on 2020-02-08.
//  Copyright © 2020 Graem Sheppard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var graphView: GraphView!
    
    // Initial wave parameters
    var wave: WaveParams = WaveParams(offsetX: 0, offsetY: 350, stretchX: 10, stretchY: 10, resolution: 1)
    
    // Modify wave parameters when a slider is changed
    @IBAction func xOffset(_ sender: UISlider) {
        wave.offsetX = Double(-sender.value)
        graphView.getPoints(wave: wave)
    }
    
    @IBAction func yOffset(_ sender: UISlider) {
        wave.offsetY = 350.0 - Double(sender.value)
        graphView.getPoints(wave: wave)
    }
    
    @IBAction func frequency(_ sender: UISlider) {
        wave.stretchX = Double(sender.value)
        graphView.getPoints(wave: wave)
    }
    
    @IBAction func amplitude(_ sender: UISlider) {
        wave.stretchY = Double(sender.value)
        graphView.getPoints(wave: wave)
    }
    
    @IBAction func resolution(_ sender: UISlider) {
        wave.resolution = Double(sender.value)
        graphView.getPoints(wave: wave)
    }
    
    
    // Get screen width and draw initial wave
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.width = Double(graphView.bounds.width)
        graphView.getPoints(wave: wave)
        
        
    }


}

