//  Created by dasdom on 17.05.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import UIKit

class DiagramView: UIView {
  
  var dataArray: [Motion] = [] {
    didSet {
      setNeedsDisplay()
    }
  }
  var lineOnePosition: CGFloat = 0.0 {
    didSet {
      setNeedsDisplay()
    }
  }
  var lineTwoPosition: CGFloat = 1.0 {
    didSet {
      setNeedsDisplay()
    }
  }
  
  override func draw(_ rect: CGRect) {
    
    let width = frame.size.width
    let height = frame.size.height
    let y0 = height/2.0
    
    var maximum: CGFloat = 0.0
    for data in dataArray {
      maximum = max(maximum, abs(value(for: data)))
    }
    
    let bezierPath = UIBezierPath()
    
    guard let firstPoint = dataArray.first,
      let lastPoint = dataArray.last,
      maximum > 0 else {
        return
    }
    
    let scale = height / (CGFloat(maximum) * 2.0)
    let y = y0 + value(for: firstPoint) * scale
    bezierPath.move(to: CGPoint(x: 0, y: y))
    
    let totalTime = lastPoint.time - firstPoint.time
    if totalTime == 0 {
      return
    }
    
    for dataPoint in dataArray {
      let timeDiff = dataPoint.time - firstPoint.time
      let x = CGFloat(timeDiff / totalTime) * width
      let y = y0 + value(for: dataPoint) * scale
      bezierPath.addLine(to: CGPoint(x: x, y: y))
    }
    
    UIColor.label.setStroke()
    bezierPath.lineWidth = 1
    bezierPath.stroke()
    
    drawVerticalLine(at: lineOnePosition, width: width, height: height)
    drawVerticalLine(at: lineTwoPosition, width: width, height: height)
    
    let zeroPath = UIBezierPath()
    zeroPath.move(to: CGPoint(x: 0, y: y0))
    zeroPath.addLine(to: CGPoint(x: width, y: y0))
    
    UIColor.gray.setStroke()
    zeroPath.lineWidth = 1
    zeroPath.stroke()
  }
    
  func value(for motion: Motion) -> CGFloat {
    return CGFloat(motion.acceleration.x * motion.gravity.x
                    + motion.acceleration.y * motion.gravity.y
                    + motion.acceleration.z * motion.gravity.z
    )
  }
  
  func drawVerticalLine(at position: CGFloat, width: CGFloat, height: CGFloat) {
    
    let linePath = UIBezierPath()
    linePath.move(to: CGPoint(x: width * position, y: 0))
    linePath.addLine(to: CGPoint(x: width * position, y: height))
    
    UIColor.red.setStroke()
    linePath.lineWidth = 1
    linePath.stroke()
  }
}
