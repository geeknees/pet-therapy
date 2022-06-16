//
// Pet Therapy.
//

import Foundation
import Physics

// MARK: - Action

public struct PetAction: Equatable {
    
    public let id: String
    public let chance: Double
    public let facingDirection: CGVector?
    
    let size: CGSize?
    let position: PetActionPosition
    
    public var hasCustomPosition: Bool { position != .inPlace }
    
    init(
        id: String,
        size: CGSize? = nil,
        position: PetActionPosition = .inPlace,
        facingDirection: CGVector? = nil,
        chance: Double = 1
    ) {
        self.id = id
        self.size = size
        self.position = position
        self.chance = chance
        self.facingDirection = facingDirection
    }
    
    public func frame(from petFrame: CGRect, in habitatBounds: CGRect) -> CGRect {
        CGRect(
            origin: position(from: petFrame, in: habitatBounds),
            size: size ?? petFrame.size
        )
    }
    
    public func position(from petFrame: CGRect, in habitatBounds: CGRect) -> CGPoint {
        switch position {
        case .inPlace: return petFrame.origin
        case .topLeftCorner: return habitatBounds.topLeft
        case .topRightCorner: return habitatBounds.topRight.offset(x: -petFrame.width)
        case .bottomRightCorner: return habitatBounds.bottomRight.offset(by: petFrame.size.oppositeSign())
        case .bottomLeftCorner: return habitatBounds.bottomLeft.offset(y: -petFrame.height)
        }
    }
}

// MARK: - Description

extension PetAction: CustomStringConvertible {
    
    public var description: String { id }
}

// MARK: - Position

enum PetActionPosition {
    case inPlace
    case topLeftCorner
    case bottomLeftCorner
    case topRightCorner
    case bottomRightCorner
}