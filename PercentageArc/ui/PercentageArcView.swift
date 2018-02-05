import Foundation

public class PercentageArcView: UIView {
    
    private var percentage: Int = 0
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
            style = makeDefaultStyle()
        }

        drawPercentage(rect, percentage, style!)
    }
    
    public func updateStyle(_ style: PercentageArcStyle) {
        self.style = style
        self.setNeedsDisplay()
    }
    
    public func updatePercentage(_ percentage: Int) {
        self.percentage = percentage
        self.setNeedsDisplay()
    }
    
    private func drawPercentage(_ rect: CGRect, _ percentage: Int, _ style: PercentageArcStyle) {
        
        // colour background
        self.backgroundColor = style.outColour
        
        // setup dimensions
        // TODO: calculate centre
        let centre = CGPoint(x: 100, y: 100)
        let radius: CGFloat = 25
        let inRadius: CGFloat = 10
        let startAngle: CGFloat = 0
        let fullAngle = CGFloat(Double.pi * 2)
        // TODO: calculate percentage angle
        let percentageAngle = CGFloat(Double.pi)
        
        // create negative arc
        let negPath = UIBezierPath(arcCenter: centre, radius: radius, startAngle: startAngle, endAngle: fullAngle, clockwise: true)
        let negLayer = CAShapeLayer()
        negLayer.path = negPath.cgPath
        negLayer.fillColor = style.negColour.cgColor
        self.layer.addSublayer(negLayer)
        
        // create positive arc
        let posPath = UIBezierPath(arcCenter: centre, radius: radius, startAngle: startAngle, endAngle: percentageAngle, clockwise: true)
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
    
    private func makeDefaultStyle() -> PercentageArcStyle {
        return PercentageArcStyle(posColour: UIColor.lightGray, negColour: UIColor.darkGray, inColour: UIColor.white, outColour: UIColor.clear)
    }
}
