import XCTest
@testable import PercentageArc

class PercentageArcUtilTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test1MakeValidPercentage() {
        let actual = PercentageArcUtil.makeValidPercentage(percentage: 0.5)
        XCTAssertEqual(actual, 0.5, "input: valid")
    }
    
    func test2MakeValidPercentage() {
        let actual = PercentageArcUtil.makeValidPercentage(percentage: 0)
        XCTAssertEqual(actual, 0, "input: valid")
    }
    
    func test3MakeValidPercentage() {
        let actual = PercentageArcUtil.makeValidPercentage(percentage: 1)
        XCTAssertEqual(actual, 1, "input: valid")
    }
    
    func test4MakeValidPercentage() {
        let actual = PercentageArcUtil.makeValidPercentage(percentage: -0.5)
        XCTAssertEqual(actual, 0, "input: invalid")
    }
    
    func test5MakeValidPercentage() {
        let actual = PercentageArcUtil.makeValidPercentage(percentage: 2)
        XCTAssertEqual(actual, 0, "input: invalid")
    }
    
    func test1FindCentre() {
        let actual = PercentageArcUtil.findCentre(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        XCTAssertEqual(actual.x, 50, "input: 100 x 100 sq")
        XCTAssertEqual(actual.y, 50, "input: 100 x 100 sq")
    }
    
    func test2FindCentre() {
        let actual = PercentageArcUtil.findCentre(rect: CGRect(x: 1, y: 8, width: 20, height: 30))
        XCTAssertEqual(actual.x, 10, "input: 20 x 30 rect")
        XCTAssertEqual(actual.y, 15, "input: 20 x 30 rect")
    }
    
    func test3FindCentre() {
        let actual = PercentageArcUtil.findCentre(rect: CGRect(x: 3, y: 1, width: 0.5, height: 3))
        XCTAssertEqual(actual.x, 0.25, "input: 0.5 x 3 rect")
        XCTAssertEqual(actual.y, 1.5, "input: 0.5 x 3 rect")
    }
    
    func test1FindRadius() {
        let actual = PercentageArcUtil.findRadius(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        XCTAssertEqual(actual, 50, "input: 100 x 100 sq")
    }
    
    func test2FindRadius() {
        let actual = PercentageArcUtil.findRadius(rect: CGRect(x: 3, y: 20, width: 30, height: 100))
        XCTAssertEqual(actual, 15, "input: 30 x 100 rect")
    }
    
    func test3FindRadius() {
        let actual = PercentageArcUtil.findRadius(rect: CGRect(x: 3, y: 1, width: 0.5, height: 3))
        XCTAssertEqual(actual, 0.25, "input: 0.5 x 3 rect")
    }
    
    func test1GetStartAngle() {
        let actual = PercentageArcUtil.getStartAngle(start: .top)
        XCTAssertEqual(actual, CGFloat.pi * 3 / 2, "input: top")
    }
    
    func test2GetStartAngle() {
        let actual = PercentageArcUtil.getStartAngle(start: .right)
        XCTAssertEqual(actual, 0, "input: right")
    }
    
    func test3GetStartAngle() {
        let actual = PercentageArcUtil.getStartAngle(start: .bottom)
        XCTAssertEqual(actual, CGFloat.pi / 2, "input: bottom")
    }
    
    func test4GetStartAngle() {
        let actual = PercentageArcUtil.getStartAngle(start: .left)
        XCTAssertEqual(actual, CGFloat.pi, "input: left")
    }
    
    func test1GetFullAngle() {
        let actual = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.top)
        XCTAssertEqual(actual, CGFloat.pi * 7 / 2, "input: top")
    }
    
    func test2GetFullAngle() {
        let actual = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.right)
        XCTAssertEqual(actual, CGFloat.pi * 2, "input: right")
    }
    
    func test3GetFullAngle() {
        let actual = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.bottom)
        XCTAssertEqual(actual, CGFloat.pi * 5 / 2, "input: bottom")
    }
    
    func test4GetFullAngle() {
        let actual = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.left)
        XCTAssertEqual(actual, CGFloat.pi * 3, "input: left")
    }
    
    func test1MakePercentageAngle() {
        let actual = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.top)
        XCTAssertEqual(actual, CGFloat.pi * 5 / 2, "input: top to 50%")
    }
    
    func test2MakePercentageAngle() {
        let actual = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.right)
        XCTAssertEqual(actual, CGFloat.pi, "input: right to 50%")
    }
    
    func test3MakePercentageAngle() {
        let actual = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.bottom)
        XCTAssertEqual(actual, CGFloat.pi * 3 / 2, "input: bottom to 50%")
    }
    
    func test4MakePercentageAngle() {
        let actual = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.left)
        XCTAssertEqual(actual, 2 * CGFloat.pi, "input: left to 50%")
    }
    
}

