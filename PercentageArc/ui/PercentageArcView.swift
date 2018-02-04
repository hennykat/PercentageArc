import Foundation

public class PercentageArcView: UIView {
    
    private var percentage: Int = 0
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updatePercentage(_ percentage: Int) {
        self.percentage = percentage
    }
}
