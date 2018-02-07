import Foundation

public class PercentageArcView: UIView {
    
    private var style: PercentageArcStyle?
    // range for percentage = [0, 1]
    private var percentage: CGFloat = 0
    
    // MARK: UIView
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        
        if style == nil {
            style = PercentageArcUtil.makeDefaultStyle()
        }

        drawPercentage(rect, percentage, style!)
    }
    
    public func updateStyle(_ style: PercentageArcStyle) {
        self.style = style
        self.setNeedsDisplay()
    }
    
    public func updatePercentage(_ percentage: CGFloat) {
        self.percentage = PercentageArcUtil.makeInRange(value: percentage)
        self.setNeedsDisplay()
    }
    
    private func drawPercentage(_ rect: CGRect, _ percentage: CGFloat, _ style: PercentageArcStyle) {
        
        // colour background
        self.backgroundColor = style.outColour
        
        // setup dimensions
        let centre = PercentageArcUtil.findCentre(rect: rect)
        let radius = PercentageArcUtil.findRadius(rect: rect)
        let inRadius = PercentageArcUtil.findInnerRadius(radius: radius, thickness: style.thickness)
        let startAngle = PercentageArcUtil.getStartAngle(start: style.start)
        let fullAngle = PercentageArcUtil.getFullAngle(startAngle: startAngle)
        let percentageAngle = PercentageArcUtil.makePercentageAngle(percentage: percentage, start: startAngle)
        
        // create negative arc
        let negPath = UIBezierPath(arcCenter: centre, radius: radius, startAngle: startAngle, endAngle: fullAngle, clockwise: true)
        let negLayer = CAShapeLayer()
        negLayer.path = negPath.cgPath
        negLayer.fillColor = style.negColour.cgColor
        self.layer.addSublayer(negLayer)
        
        // create positive arc
        let posPath = UIBezierPath(arcCenter: centre, radius: radius, startAngle: startAngle, endAngle: percentageAngle, clockwise: true)
        posPath.addLine(to: centre)
        let posLayer = CAShapeLayer()
        posLayer.path = posPath.cgPath
        posLayer.fillColor = style.posColour.cgColor
        self.layer.addSublayer(posLayer)
        
        if inRadius == 0 {
            // no need for inner circle
            return;
        }
        
        // create inner circle
        let inPath = UIBezierPath(arcCenter: centre, radius: inRadius, startAngle: startAngle, endAngle: fullAngle, clockwise: true)
        let inLayer = CAShapeLayer()
        inLayer.path = inPath.cgPath
        inLayer.fillColor = style.inColour.cgColor
        self.layer.addSublayer(inLayer)
    }

}
