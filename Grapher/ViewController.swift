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
    
    var wave: WaveParams = WaveParams(offsetX: 0, offsetY: 250, stretchX: 10, stretchY: 10)
    
    @IBAction func xOffset(_ sender: UISlider) {
        wave.offsetX = Int(-sender.value)
        graphView.getPoints(wave: wave)
    }
    
    @IBAction func yOffset(_ sender: UISlider) {
        wave.offsetY = Int(Float(500) - sender.value)
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.width = Float(graphView.bounds.width)
        graphView.getPoints(wave: wave)
        
        
    }


}

