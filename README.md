# Identifiable

⚠️ Identifiable is new-as-can-be and lots of stuff is missing. Feel free to
[contribute][CONTRIBUTING].

Identifiable is a library that lets you get rid of the string-based identifying of
`UIViewController` when instantiating from storyboards, and instead deal with them
in a type-safe way. Support for *reuseIdentifiers* for `UITableViewCells` and
`UICollectionViewCell` are coming. 

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

For more information, see the [Documentation](DOCUMENTATION.md).

## Version Compatibility

Note that we're aggressive about pushing `master` forward along with new
versions of Swift. Therefore, we highly recommend against pointing at `master`,
and instead using [one of the releases we've provided][releases], which there
currently are none of, which is another way of saying that shit is going down
and stuff is breaking all over the place at the moment.

Here is the current Swift compatibility breakdown:

| Swift Version | Identifiable Version |
| ------------- | -------------------- |
| 3.X           | 0.1.X                |


[releases]: https://github.com/ChrisBuchholz/Identifiable/releases

## Installation

### Swift Package Manager

Add the following line to your `dependencies` list in your `Package.swift`:

```
.Package(url: "https://github.com/ChrisBuchholz/Identifiable.git",
majorVersion: 0, minor: 1),
```

### Carthage

Support for Carthage are coming. Do feel welcome to make a pull-request for
this feature.

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