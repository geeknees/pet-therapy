//
// Pet Therapy.
//

import XCTest

@testable import Physics

class MovesLinearlyTests: XCTestCase {
    
    func testPositionProperlyUpdates() {
        let entity = PhysicsEntity(
            id: "entity",
            frame: CGRect(x: 0, y: 0, width: 1, height: 1),
            behaviors: [MovesLinearly.self]
        )
        entity.set(direction: .init(dx: 1, dy: 0))
        entity.speed = 1
        
        entity.update(with: [], after: 0.1)
        XCTAssertEqual(entity.frame.origin.x, 0.1, accuracy: 0.00001)
        XCTAssertEqual(entity.frame.origin.y, 0, accuracy: 0.00001)
        
        entity.update(with: [], after: 1)
        XCTAssertEqual(entity.frame.origin.x, 1.1, accuracy: 0.00001)
        XCTAssertEqual(entity.frame.origin.y, 0, accuracy: 0.00001)
        
        entity.update(with: [], after: 10)
        XCTAssertEqual(entity.frame.origin.x, 11.1, accuracy: 0.00001)
        XCTAssertEqual(entity.frame.origin.y, 0, accuracy: 0.00001)
    }
}