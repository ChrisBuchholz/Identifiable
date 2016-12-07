import UIKit

public extension Identifiable where Self: UIStoryboard {
    // on initial tries, it doesn't seem possible to use a signature like 
    // `init(_ bundle: Bundle? = nil)` thus making it possible to instantiate
    // a Identifiable UIStoryboard simply with `init()` because it will get
    // to the initial initializer instead, which wont work, and
    // we therefore use this more expressive `init(_ bundle: Bundle?)` signature
    // for now.
    // Seems to be partly caused by SR-584: https://bugs.swift.org/browse/SR-584
    // and party because we can't enable dynamic dispatch in protocol extensions
    public init(_ bundle: Bundle?) {
        self.init(name: Self.identifier, bundle: bundle)
    }
    
    public static func instantiateViewController<T: UIViewController>(_: T.Type) -> T where T: Identifiable {
        let storyboard = Self(nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("View controller with identifier '\(T.identifier)' in '\(self.identifier)' is not of type '\(T.self)'")
        }
        return vc
    }
    
    public static func instantiateInitialViewController<T: UIViewController>(_: T.Type) -> T where T: Identifiable {
        let storyboard = Self(nil)
        guard let vc = storyboard.instantiateInitialViewController() as? T else {
            fatalError("Initial view controller in '\(self.identifier)' is not of type '\(T.identifier)'")
        }
        return vc
    }
}
