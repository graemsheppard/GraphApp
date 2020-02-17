//
//  GraphView.swift
//  Grapher
//
//  Created by Graem Sheppard on 2020-02-08.
//  Copyright © 2020 Graem Sheppard. All rights reserved.
//

import UIKit

// Struct to keep track of parameters
struct WaveParams {
    var offsetX: Double
    var offsetY: Double
    var stretchX: Double
    var stretchY: Double
    var resolution: Double
}

class GraphView: UIView {
    
    // Declare variables
    var points: [CGPoint] = [CGPoint]()
    var strokeColor = UIColor.black.cgColor
    var width: Double = 0
    
    // Empties points array and refills it based on given wave parameters
    func getPoints (wave: WaveParams) {
        points = []
        for i in 0...Int(width * wave.resolution) {
            let x: Double = Double(i) / wave.resolution
            let y: Double = wave.offsetY + wave.stretchY * sin((x - wave.offsetX) / wave.stretchX)
            points.append(CGPoint(x: x, y: y))
        }
        // Force the draw function to be called
        setNeedsDisplay()
    }
    
    
    override func draw (_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setLineWidth(4)
        ctx?.setLineCap(.round)
        
        // Draw a line between a point and the next
        for i in 0...(points.count - 2) {
            ctx?.beginPath()
            ctx?.move(to: points[i])
            ctx?.addLine(to: points[i + 1])
            ctx?.setStrokeColor(strokeColor)
            ctx?.strokePath()
        }

        
    }
    
   
    
    
}
