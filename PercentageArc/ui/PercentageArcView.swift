import Foundation

public class PercentageArcView: UIView {
    
    private var percentage: CGFloat = 0
    private var style: PercentageArcStyle?
    
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
        self.percentage = PercentageArcUtil.makeValidPercentage(percentage: percentage)
        self.setNeedsDisplay()
    }
    
    private func drawPercentage(_ rect: CGRect, _ percentage: CGFloat, _ style: PercentageArcStyle) {
        
        // colour background
        self.backgroundColor = style.outColour
        
        // setup dimensions
        let centre = PercentageArcUtil.findCentre(rect: rect)
        let radius = PercentageArcUtil.findRadius(rect: rect)
        // TODO: calculate inner radius based on user specs
        let inRadius = radius - 20
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
        
        // create inner circle
        let inPath = UIBezierPath(arcCenter: centre, radius: inRadius, startAngle: startAngle, endAngle: fullAngle, clockwise: true)
        let inLayer = CAShapeLayer()
        inLayer.path = inPath.cgPath
        inLayer.fillColor = style.inColour.cgColor
        self.layer.addSublayer(inLayer)
    }

}
