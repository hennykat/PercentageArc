import XCTest
@testable import PercentageArc

class PercentageArcUtilTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
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
    
}

