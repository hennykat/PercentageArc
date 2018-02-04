import Foundation

public class PercentageArcStyle: NSObject {
    
    // colour of percentage arc
    private let arcColour: UIColor
    // colour of inner circle
    private let inColour: UIColor
    // colour of outer edges
    private let outColour: UIColor
    
    public init(arcColour: UIColor, inColour: UIColor, outColour: UIColor) {
        self.arcColour = arcColour
        self.inColour = inColour
        self.outColour = outColour
    }
}
