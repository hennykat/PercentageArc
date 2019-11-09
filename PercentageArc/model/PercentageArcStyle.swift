import UIKit

/// Defines styling for the percentage arc
public class PercentageArcStyle {
    
    /// colour of positive percentage arc
    public let positiveColour: UIColor
    /// colour of negative percentage arc
    public let negativeColour: UIColor
    /// colour of inner circle
    public let innerColour: UIColor
    /// colour of outer edges
    public let outerColour: UIColor
    /// where the arc will start
    public let start: PercentageArcStart
    /// how thick the arc will be in relation to available space, range [0, 1]
    public let thickness: CGFloat
    
    public init(positiveColour: UIColor,
                negativeColour: UIColor,
                innerColour: UIColor,
                outerColour: UIColor,
                start: PercentageArcStart = .right,
                thickness: CGFloat = 0.33) {
        
        self.positiveColour = positiveColour
        self.negativeColour = negativeColour
        self.innerColour = innerColour
        self.outerColour = outerColour
        self.start = start
        self.thickness = thickness
    }
}
