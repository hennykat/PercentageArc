import UIKit

public class PercentageArcView: UIView {
    
    private var style: PercentageArcStyle = PercentageArcUtil.makeDefaultStyle()
    // range for percentage = [0, 1]
    private var percentage: CGFloat = 0
    
    // MARK: UIView
    
    public init(frame: CGRect,
                style: PercentageArcStyle = PercentageArcUtil.makeDefaultStyle(),
                percentage: CGFloat = 0) {
        
        super.init(frame: frame)
        self.style = style
        self.percentage = percentage
        self.backgroundColor = style.outerColour
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        drawPercentage(rect, percentage, style)
    }
    
    public func updateStyle(_ style: PercentageArcStyle) {
        self.style = style
        backgroundColor = style.outerColour
        setNeedsDisplay()
    }
    
    public func updatePercentage(_ percentage: CGFloat) {
        self.percentage = PercentageArcUtil.makeInRange(value: percentage)
        setNeedsDisplay()
    }
    
    private func drawPercentage(
        _ rect: CGRect,
        _ percentage: CGFloat,
        _ style: PercentageArcStyle) {
        
        // setup dimensions
        let centre = PercentageArcUtil.findCentre(rect: rect)
        let radius = PercentageArcUtil.findRadius(rect: rect)
        let inRadius = PercentageArcUtil.findInnerRadius(
            radius: radius,
            thickness: style.thickness
        )
        let startAngle = PercentageArcUtil.getStartAngle(start: style.start)
        let fullAngle = PercentageArcUtil.getFullAngle(startAngle: startAngle)
        let percentageAngle = PercentageArcUtil.makePercentageAngle(
            percentage: percentage,
            start: startAngle
        )
        
        // create negative arc
        let negPath = UIBezierPath(
            arcCenter: centre,
            radius: radius,
            startAngle: startAngle,
            endAngle: fullAngle,
            clockwise: true
        )
        let negLayer = CAShapeLayer()
        negLayer.path = negPath.cgPath
        negLayer.fillColor = style.negativeColour.cgColor
        layer.addSublayer(negLayer)
        
        // create positive arc
        let posPath = UIBezierPath(
            arcCenter: centre,
            radius: radius,
            startAngle: startAngle,
            endAngle: percentageAngle,
            clockwise: true
        )
        posPath.addLine(to: centre)
        let posLayer = CAShapeLayer()
        posLayer.path = posPath.cgPath
        posLayer.fillColor = style.positiveColour.cgColor
        layer.addSublayer(posLayer)
        
        if inRadius == 0 {
            // no need for inner circle
            return;
        }
        
        // create inner circle
        let inPath = UIBezierPath(
            arcCenter: centre,
            radius: inRadius,
            startAngle: startAngle,
            endAngle: fullAngle,
            clockwise: true
        )
        let inLayer = CAShapeLayer()
        inLayer.path = inPath.cgPath
        inLayer.fillColor = style.innerColour.cgColor
        layer.addSublayer(inLayer)
    }

}
