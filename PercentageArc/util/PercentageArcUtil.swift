import Foundation

public class PercentageArcUtil {
    
    static let top: CGFloat = CGFloat.pi * 3 / 2
    static let right: CGFloat = 0
    static let bottom: CGFloat = CGFloat.pi / 2
    static let left: CGFloat = CGFloat.pi
    
    static let full: CGFloat = CGFloat.pi * 2
    
    static func makeValidPercentage(percentage: CGFloat) -> CGFloat {
        
        if percentage < 0 || percentage > 1 {
            print("Invalid percentage input.  Must be in range [0, 1].")
            return 0
        } else {
            return percentage
        }
    }
    
    static func findCentre(rect: CGRect) -> CGPoint {
        
        // centre in boundary
        let x = rect.width / 2
        let y = rect.height / 2
        
        // square boundary
        return CGPoint(x: x, y: y)
    }
    
    static func findRadius(rect: CGRect) -> CGFloat {
        
        // find smallest side centre
        let minSide = min(rect.width, rect.height)
        return minSide / 2
    }
    
    static func getStartAngle(start: PercentageArcStart) -> CGFloat {
        
        switch(start) {
        case .top:
            return top
        case .right:
            return right
        case .bottom:
            return bottom
        case .left:
            return left
        }
    }
    
    static func getFullAngle(startAngle: CGFloat) -> CGFloat {
        return startAngle + full
    }
    
    static func makePercentageAngle(percentage: CGFloat, start: CGFloat) -> CGFloat {
        let angle = percentage * full
        // add to offset
        return start + angle
    }
    
    static func makeDefaultStyle() -> PercentageArcStyle {
        return PercentageArcStyle(posColour: UIColor.lightGray, negColour: UIColor.darkGray, inColour: UIColor.white, outColour: UIColor.clear)
    }
}
