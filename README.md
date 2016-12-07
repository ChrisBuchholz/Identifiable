# Identifiable [![Build Status](https://travis-ci.org/ChrisBuchholz/Identifiable.svg?branch=master)](https://travis-ci.org/ChrisBuchholz/Identifiable) [![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

⚠️ Identifiable is new-as-can-be and lots of stuff is missing. Feel free to
[contribute][CONTRIBUTING].

Identifiable is a library that lets you get rid of the string-based identifying
when instantiating `UIViewControllers` from storyboards, or when loading a
`UIStoryboard` from a file, and instead deal with them in a type-safe way.
Support for *reuseIdentifiers* for `UITableViewCells` and `UICollectionViewCell`
is coming. 

## Usage tl;dr:

Say you have a storyboard called `MainStoryboard.storyboard`, and inside that,
you have an initial view controller of type `MyInitialViewController` and
storyboard ID `MyInitialViewController`. Inside the storyboard, there is also
another view controller of type `MySecondViewController` with ID
`MySecondViewController`, you can now present the second view controller like
this:

```swift
import UIKit
import Identifiable

final class MainStoryboard: UIStoryboard, Identifiable {}
final class MyInitialViewController: UIViewController, Identifiable {}
final class MySecondViewController: UIViewController, Identifiable {}

let firstViewController = MainStoryboard.instantiateInitialViewController(MyInitialViewController.self) 
let secondViewController = MainStoryboard.instantiateViewController(MySecondViewController.self)
firstViewController.present(secondViewController, animated: true)
```

The key here is in the declaration of the classes `MainStoryboard`,
`MyInitialViewController`, and `MySecondViewController`.
By declaring them with the mixin `Identifiable`, it becomes possible for
them to talk with, and use each other, in an agreed upon language. The only
important details to remember is that any `UIViewController`s storyboard
ID should be the same as it's class name, meaning that the view controller of
type `MySecondViewController` must have the storyboard ID
`MySecondViewController`. Likewise, `MainStoryboard` will only be
*identifiable* if a storyboard with the file name `MainStoryboard.storyboard`
exists.

For more information, see the [Documentation](DOCUMENTATION.md).

## Version Compatibility

Note that we're aggressive about pushing `master` forward along with new
versions of Swift. Therefore, we highly recommend against pointing at `master`,
and instead using [one of the releases we've provided][releases].

Here is the current Swift compatibility breakdown:

| Swift Version | Identifiable Version |
| ------------- | -------------------- |
| 3.X           | 0.1.X                |


[releases]: https://github.com/ChrisBuchholz/Identifiable/releases

## Installation

### [Swift Package Manager]

[Swift Package Manager]: https://swift.org/package-manager/

Add the following line to your `dependencies` list in your `Package.swift`:

```
.Package(url: "https://github.com/ChrisBuchholz/Identifiable.git",
majorVersion: 0, minor: 1),
```

### [Carthage]

[Carthage]: https://github.com/Carthage/Carthage

Add the following to your Cartfile:

```
github "ChrisBuchholz/Identifiable"
```

Then run `carthage update`.

Follow the current instructions in [Carthage's README][carthage-installation]
for up to date installation instructions.

[carthage-installation]: https://github.com/Carthage/Carthage#adding-frameworks-to-an-application

### CocoaPods

Support for CocoaPods are coming. Do feel welcome to make a pull-request for
this feature.

## Contributing

See the [CONTRIBUTING] document. Thank you, [contributors]!

[CONTRIBUTING]: CONTRIBUTING.md
[contributors]: https://github.com/ChrisBuchholz/Identifiable/graphs/contributors

## License

Identifiable is Copyright (c) 2016 Christoffer Buchholz. It is free software, and
may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE
