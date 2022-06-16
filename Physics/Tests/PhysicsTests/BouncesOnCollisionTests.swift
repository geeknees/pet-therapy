//
// Pet Therapy.
//

import XCTest

@testable import Physics

class BouncesOnCollisionTests: XCTestCase {
    
    func testBouncesToLeftWhenHittingRight() {
        let entity = PhysicsEntity(id: "entity", frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        entity.set(direction: .init(dx: 1, dy: 0))
        
        let other = PhysicsEntity(id: "other", frame: CGRect(x: 8, y: 0, width: 4, height: 100))
        let collisions = entity.collisions(with: [other])
        
        let bounce = BouncesOnCollision(with: entity)
        let angle = bounce.bouncingAngle(collisions: collisions)
        XCTAssertEqual(angle, .pi)
        
        entity.behaviors = [bounce]
        entity.update(with: collisions, after: 0.01)
        XCTAssertEqual(entity.direction.dx, -1, accuracy: 0.00001)
        XCTAssertEqual(entity.direction.dy, 0, accuracy: 0.00001)
    }
    
    func testBouncesToRightWhenHittingLeft() {
        let entity = PhysicsEntity(id: "entity", frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        entity.set(direction: .init(dx: -1, dy: 0))
        
        let other = PhysicsEntity(id: "other", frame: CGRect(x: -2, y: 0, width: 4, height: 100))
        let collisions = entity.collisions(with: [other])
        
        let bounce = BouncesOnCollision(with: entity)
        let angle = bounce.bouncingAngle(collisions: collisions)
        XCTAssertEqual(angle, 0)
        
        entity.behaviors = [bounce]
        entity.update(with: collisions, after: 0.01)
        XCTAssertEqual(entity.direction.dx, 1, accuracy: 0.00001)
        XCTAssertEqual(entity.direction.dy, 0, accuracy: 0.00001)
    }
}