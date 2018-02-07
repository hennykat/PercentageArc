import XCTest
@testable import PercentageArc

class PercentageArcUtilTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test1MakeInRange() {
        let result = PercentageArcUtil.makeInRange(value: 0.5)
        XCTAssertEqual(result, 0.5, "input: valid")
    }
    
    func test2MakeInRange() {
        let result = PercentageArcUtil.makeInRange(value: 0)
        XCTAssertEqual(result, 0, "input: valid")
    }
    
    func test3MakeInRange() {
        let result = PercentageArcUtil.makeInRange(value: 1)
        XCTAssertEqual(result, 1, "input: valid")
    }
    
    func test4MakeInRange() {
        let result = PercentageArcUtil.makeInRange(value: -0.5)
        XCTAssertEqual(result, 0, "input: invalid")
    }
    
    func test5MakeInRange() {
        let result = PercentageArcUtil.makeInRange(value: 2)
        XCTAssertEqual(result, 0, "input: invalid")
    }
    
    func test1FindCentre() {
        let result = PercentageArcUtil.findCentre(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        XCTAssertEqual(result.x, 50, "input: 100 x 100 sq")
        XCTAssertEqual(result.y, 50, "input: 100 x 100 sq")
    }
    
    func test2FindCentre() {
        let result = PercentageArcUtil.findCentre(rect: CGRect(x: 1, y: 8, width: 20, height: 30))
        XCTAssertEqual(result.x, 10, "input: 20 x 30 rect")
        XCTAssertEqual(result.y, 15, "input: 20 x 30 rect")
    }
    
    func test3FindCentre() {
        let result = PercentageArcUtil.findCentre(rect: CGRect(x: 3, y: 1, width: 0.5, height: 3))
        XCTAssertEqual(result.x, 0.25, "input: 0.5 x 3 rect")
        XCTAssertEqual(result.y, 1.5, "input: 0.5 x 3 rect")
    }
    
    func test1FindRadius() {
        let result = PercentageArcUtil.findRadius(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        XCTAssertEqual(result, 50, "input: 100 x 100 sq")
    }
    
    func test2FindRadius() {
        let result = PercentageArcUtil.findRadius(rect: CGRect(x: 3, y: 20, width: 30, height: 100))
        XCTAssertEqual(result, 15, "input: 30 x 100 rect")
    }
    
    func test3FindRadius() {
        let result = PercentageArcUtil.findRadius(rect: CGRect(x: 3, y: 1, width: 0.5, height: 3))
        XCTAssertEqual(result, 0.25, "input: 0.5 x 3 rect")
    }
    
    func test1FindInnerRadius() {
        let result = PercentageArcUtil.findInnerRadius(radius: 20.0, thickness: 0.5)
        XCTAssertEqual(result, 10, "input: half")
    }
    
    func test2FindInnerRadius() {
        let result = PercentageArcUtil.findInnerRadius(radius: 10.0, thickness: 0.0)
        XCTAssertEqual(result, 10, "input: none")
    }
    
    func test3FindInnerRadius() {
        let result = PercentageArcUtil.findInnerRadius(radius: 30.0, thickness: 1.0)
        XCTAssertEqual(result, 0, "input: whole")
    }
    
    func test1GetStartAngle() {
        let result = PercentageArcUtil.getStartAngle(start: .top)
        XCTAssertEqual(result, CGFloat.pi * 3 / 2, "input: top")
    }
    
    func test2GetStartAngle() {
        let result = PercentageArcUtil.getStartAngle(start: .right)
        XCTAssertEqual(result, 0, "input: right")
    }
    
    func test3GetStartAngle() {
        let result = PercentageArcUtil.getStartAngle(start: .bottom)
        XCTAssertEqual(result, CGFloat.pi / 2, "input: bottom")
    }
    
    func test4GetStartAngle() {
        let result = PercentageArcUtil.getStartAngle(start: .left)
        XCTAssertEqual(result, CGFloat.pi, "input: left")
    }
    
    func test1GetFullAngle() {
        let result = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.top)
        XCTAssertEqual(result, CGFloat.pi * 7 / 2, "input: top")
    }
    
    func test2GetFullAngle() {
        let result = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.right)
        XCTAssertEqual(result, CGFloat.pi * 2, "input: right")
    }
    
    func test3GetFullAngle() {
        let result = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.bottom)
        XCTAssertEqual(result, CGFloat.pi * 5 / 2, "input: bottom")
    }
    
    func test4GetFullAngle() {
        let result = PercentageArcUtil.getFullAngle(startAngle: PercentageArcUtil.left)
        XCTAssertEqual(result, CGFloat.pi * 3, "input: left")
    }
    
    func test1MakePercentageAngle() {
        let result = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.top)
        XCTAssertEqual(result, CGFloat.pi * 5 / 2, "input: top to 50%")
    }
    
    func test2MakePercentageAngle() {
        let result = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.right)
        XCTAssertEqual(result, CGFloat.pi, "input: right to 50%")
    }
    
    func test3MakePercentageAngle() {
        let result = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.bottom)
        XCTAssertEqual(result, CGFloat.pi * 3 / 2, "input: bottom to 50%")
    }
    
    func test4MakePercentageAngle() {
        let result = PercentageArcUtil.makePercentageAngle(percentage: 0.5, start: PercentageArcUtil.left)
        XCTAssertEqual(result, 2 * CGFloat.pi, "input: left to 50%")
    }
    
}

