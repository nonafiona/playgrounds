import UIKit
import PlaygroundSupport

struct SpirographGenerator : IteratorProtocol {
    
    // Setting up properties
    var pointOffset : Double
    var dTheta : Double
    var dR : Double
    var minorRadius : Double
    var majorRadius : Double
    var theta = 0.0
    typealias Element = CGPoint
    
    init(majorRadius : Double, minorRadius : Double, pointOffset : Double, samples : Double)
    {
        self.pointOffset = pointOffset
        self.dTheta = Double(M_PI) * (2.0) / samples
        self.majorRadius = majorRadius
        self.minorRadius = minorRadius
        self.dR = majorRadius - minorRadius
    }
    
    mutating func next() -> CGPoint? {
        let xT : Double = dR * cos(theta) + pointOffset * cos(dR * theta / minorRadius)
        let yT : Double = dR * sin(theta) + pointOffset * sin (dR * theta / minorRadius)
        theta = theta + dTheta
        return CGPoint(x: CGFloat(xT), y: CGFloat(yT))
    }
}

//  sample size
let n = 100

// offset in the image
let (majorRadius, minorRadius) = (48, -47) // you can change the major & minor values

// number of iterations 
let iterations = 15 // you can change the number of iterations

// instance of the Spirograph struct
var spiro = SpirographGenerator(majorRadius: Double(majorRadius), minorRadius: Double(minorRadius), pointOffset: 13, samples: Double(n)) // you can change the point offset value

let dimension_2:CGFloat = 125 // you can change the dimension value

//  image size
let size = CGSize(width: dimension_2 * 2, height: dimension_2 * 2)

UIGraphicsBeginImageContext(size)
let ctx = UIGraphicsGetCurrentContext()
for i in 0...iterations*n {
    let p:CGPoint? = spiro.next()
    NSLog("%@",NSStringFromCGPoint(p!))
    if i == 0 {
        ctx?.move(to: CGPoint(x: p!.x+dimension_2, y: p!.y+dimension_2))
    }
    else {
        ctx?.move(to: CGPoint(x: p!.x+dimension_2, y: p!.y+dimension_2))
    }
}

// draw & show the result
ctx?.strokePath()
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

