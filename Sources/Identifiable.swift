import UIKit

public protocol Identifiable: class {
    static var identifier: String { get }
}

public extension Identifiable {
    public static var identifier: String {
        return String(describing: Self.self)
    }
}
