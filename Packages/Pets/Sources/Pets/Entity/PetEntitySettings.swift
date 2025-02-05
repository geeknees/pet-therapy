import DesignSystem
import SwiftUI
import Yage
import YageLive

// MARK: - Incremental Id

extension PetEntity {
    static func id(for species: Species) -> String {
        nextNumber += 1
        return "\(species.id)-\(nextNumber)"
    }

    private static var nextNumber = 0
}

// MARK: - Speed

public extension PetEntity {
    internal static let baseSpeed: CGFloat = 30

    static func speed(for species: Species, size: CGFloat, settings: CGFloat) -> CGFloat {
        species.speed * speedMultiplier(for: size) * settings
    }

    static func speedMultiplier(for size: CGFloat) -> CGFloat {
        let sizeRatio = size / PetSize.defaultSize
        return baseSpeed * sizeRatio
    }
}

// MARK: - Initial Frame

extension PetEntity {
    static func initialFrame(in worldBounds: CGRect, size: CGFloat) -> CGRect {
        let randomX = worldBounds.width * CGFloat.random(in: 0.2 ... 0.8)
        return CGRect(origin: CGPoint(x: randomX, y: 30), size: CGSize(square: size))
    }
}
