import Foundation

public class PercentageArcStyle: NSObject {
    
    // colour of positive percentage arc
    public let posColour: UIColor
    // colour of negative percentage arc
    public let negColour: UIColor
    // colour of inner circle
    public let inColour: UIColor
    // colour of outer edges
    public let outColour: UIColor
    // where the arc will start
    public let start: PercentageArcStart
    // how thick the arc will be in relation to available space, range [0, 1]
    public let thickness: CGFloat
    
    public init(posColour: UIColor, negColour: UIColor, inColour: UIColor, outColour: UIColor, start: PercentageArcStart = .right, thickness: CGFloat = 0.33) {
        self.posColour = posColour
        self.negColour = negColour
        self.inColour = inColour
        self.outColour = outColour
        self.start = start
        self.thickness = thickness
    }
}
