import UIKit

public class PercentageArcUtil {
    
    // arc start consts
    static let top: CGFloat = CGFloat.pi * 3 / 2
    static let right: CGFloat = 0
    static let bottom: CGFloat = CGFloat.pi / 2
    static let left: CGFloat = CGFloat.pi
    // angle of full arc
    static let full: CGFloat = CGFloat.pi * 2
    
    static func makeInRange(value: CGFloat) -> CGFloat {
        if value < 0 || value > 1 {
            print("Invalid input: \(value).  Must be in range [0, 1].")
            return 0
        } else {
            return value
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
    
    static func findInnerRadius(radius: CGFloat, thickness: CGFloat) -> CGFloat {
        let thickVal = makeInRange(value: thickness)
        return radius * (1 - thickVal)
    }
    
    static func getStartAngle(start: PercentageArcStart) -> CGFloat {
        switch start {
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
    
    public static func makeDefaultStyle() -> PercentageArcStyle {
        return PercentageArcStyle(
            positiveColour: UIColor.lightGray,
            negativeColour: UIColor.darkGray,
            innerColour: UIColor.white,
            outerColour: UIColor.clear
        )
    }
}
