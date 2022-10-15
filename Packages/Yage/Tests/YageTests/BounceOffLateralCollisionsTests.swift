import XCTest

@testable import Yage

class BounceOnLateralCollisionsTests: XCTestCase {
    
    private let testEnv = World(bounds: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    private lazy var testEntity: Entity = {
        let entity = Entity(
            id: "entity",
            frame: CGRect(x: 50, y: 0, width: 10, height: 10),
            in: testEnv.bounds
        )
        bounce = BounceOnLateralCollisions()
        entity.install(bounce)
        testEnv.children.append(entity)
        return entity
    }()
    
    private var bounce: BounceOnLateralCollisions!
    
    func testBouncesToLeftWhenHittingRight() {
        testEntity.set(origin: CGPoint(x: 50, y: 0))
        testEntity.set(direction: .init(dx: 1, dy: 0))
        let testRight = Entity(
            id: "right",
            frame: CGRect(
                x: testEntity.frame.maxX - 5,
                y: 0, width: 50, height: 50
            ),
            in: testEnv.bounds
        )
        testEnv.children.append(testRight)
        
        let collisions = testEntity.collisions(with: [testRight])
        let angle = bounce.bouncingAngle(from: 0, with: collisions)
        XCTAssertEqual(angle, CGFloat.pi)
        
        testEntity.update(with: collisions, after: 0.01)
        XCTAssertEqual(testEntity.direction.dx, -1, accuracy: 0.00001)
        XCTAssertEqual(testEntity.direction.dy, 0, accuracy: 0.00001)
    }
    
    func testBouncesToRightWhenHittingLeft() {
        testEntity.set(origin: CGPoint(x: 50, y: 0))
        testEntity.set(direction: .init(dx: -1, dy: 0))
        let testLeft = Entity(
            id: "left",
            frame: CGRect(
                x: testEntity.frame.minX - 50 + 5,
                y: 0, width: 50, height: 50
            ),
            in: testEnv.bounds
        )
        testEnv.children.append(testLeft)
        
        let collisions = testEntity.collisions(with: [testLeft])
        let angle = bounce.bouncingAngle(from: .pi, with: collisions)
        XCTAssertEqual(angle, 0)
        
        testEntity.update(with: collisions, after: 0.01)
        XCTAssertEqual(testEntity.direction.dx, 1, accuracy: 0.00001)
        XCTAssertEqual(testEntity.direction.dy, 0, accuracy: 0.00001)
    }
}