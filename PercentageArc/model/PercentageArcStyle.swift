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
    
    public init(posColour: UIColor, negColour: UIColor, inColour: UIColor, outColour: UIColor) {
        self.posColour = posColour
        self.negColour = negColour
        self.inColour = inColour
        self.outColour = outColour
    }
}
