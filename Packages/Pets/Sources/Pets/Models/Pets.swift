import CoreGraphics
import Foundation
import Yage

public struct Pet {    
    public let id: String
    public let behaviors: [PetBehavior]
    public let capabilities: () -> Capabilities
    public let isPaid: Bool
    public let fps: TimeInterval
    public let speed: CGFloat
    public let movementPath: String
    public let dragPath: String
    
    init(
        id: String,
        behaviors: [PetBehavior] = [],
        capabilities: @escaping () -> Capabilities = { .defaults() },
        isPaid: Bool = false,
        fps: TimeInterval = 10,
        movementPath: String = "walk",
        dragPath: String = "drag",
        speed: CGFloat = 1
    ) {
        self.id = id
        self.behaviors = behaviors
        self.capabilities = capabilities
        self.isPaid = isPaid
        self.fps = fps
        self.movementPath = movementPath
        self.dragPath = dragPath
        self.speed = speed
    }
}

// MARK: - Equatable

extension Pet: Equatable {
    
    public static func == (lhs: Pet, rhs: Pet) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Shiny

extension Pet {
    
    func shiny(id shinyId: String, isPaid shinyPaid: Bool = false) -> Pet {
        return Pet(
            id: shinyId,
            behaviors: behaviors,
            capabilities: capabilities,
            isPaid: shinyPaid,
            fps: fps,
            movementPath: movementPath,
            dragPath: dragPath,
            speed: speed
        )
    }
}

// MARK: - Constants

extension String {
    
    public static let fly = "fly"
    public static let walk = "walk"
    public static let front = "front"
}
