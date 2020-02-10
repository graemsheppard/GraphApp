//
//  GraphView.swift
//  Grapher
//
//  Created by Graem Sheppard on 2020-02-08.
//  Copyright © 2020 Graem Sheppard. All rights reserved.
//

import UIKit

struct WaveParams {
    var offsetX: Int
    var offsetY: Int
    var stretchX: Double
    var stretchY: Double
}

class GraphView: UIView {
    
    
    
    struct Stroke {
        var firstPoint: CGPoint
        var lastPoint: CGPoint
    }
    
    var strokes: [Stroke] = [Stroke]()
    var strokeColor = UIColor.black.cgColor
    var width: Float = 0
    
    func getPoints (wave: WaveParams) {
        strokes = []
        let mult: Double = 0.125
        for n in 0...Int(width / Float(mult)) {
            var stroke: Stroke = Stroke(firstPoint: CGPoint(x: 0, y: 0), lastPoint: CGPoint(x: 0,y: 0))
            var val: Double = mult * Double(n)
            stroke.firstPoint = CGPoint(x: Double(val), y: Double(wave.offsetY) + wave.stretchY * sin(Double(wave.offsetX) - val / wave.stretchX))
            val += Double(mult / 2)
            stroke.lastPoint = CGPoint(x: Double(val), y: Double(wave.offsetY) + wave.stretchY * sin(Double(wave.offsetX) - val / wave.stretchX))
            strokes.append(stroke)
            setNeedsDisplay()
        }
    }
    
    
    override func draw (_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setLineWidth(4)
        ctx?.setLineCap(.round)
        
        for stroke in strokes {
            ctx?.beginPath()
            ctx?.move(to: stroke.firstPoint)
            ctx?.addLine(to: stroke.lastPoint)
            ctx?.setStrokeColor(strokeColor)
            ctx?.strokePath()
        }

        
    }
    
   
    
    
}
