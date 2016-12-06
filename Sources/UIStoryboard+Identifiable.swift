import UIKit

public extension Identifiable where Self: UIStoryboard {
    // on initial tries, it doesn't seem possible to use a signature like 
    // `init(_ bundle: Bundle? = nil)` thus making it possible to instantiate
    // a Identifiable UIStoryboard simply with `init()` because will fall
    // through to the designated initializer instead, which want work, and
    // we therefore use this more expressive `init(bundle: Bundle?)` signature
    // for now
    public init(bundle: Bundle?) {
        self.init(name: Self.identifier, bundle: bundle)
    }
    
    public static func instantiateViewController<T: UIViewController>(_: T.Type) -> T where T: Identifiable {
        let storyboard = Self.init(bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("View controller with identifier '\(T.identifier)' in '\(self.identifier)' is not of type '\(T.self)'")
        }
        return vc
    }
    
    public static func instantiateInitialViewController<T: UIViewController>(_: T.Type) -> T where T: Identifiable {
        let storyboard = Self.init(bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? T else {
            fatalError("Initial view controller in '\(self.identifier)' is not of type '\(T.identifier)'")
        }
        return vc
    }
}
