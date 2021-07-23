# Swifty Progress Hud

[![CI Status](https://img.shields.io/travis/AtifNaveed/SwiftyProgressHud.svg?style=flat)](https://travis-ci.org/AtifNaveed/SwiftyProgressHud)
[![Version](https://img.shields.io/cocoapods/v/SwiftyProgressHud.svg?style=flat)](https://cocoapods.org/pods/SwiftyProgressHud)
[![License](https://img.shields.io/cocoapods/l/SwiftyProgressHud.svg?style=flat)](https://cocoapods.org/pods/SwiftyProgressHud)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyProgressHud.svg?style=flat)](https://cocoapods.org/pods/SwiftyProgressHud)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftyProgressHud is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftyProgressHud'
```

## Usage
    var hud = SwiftyProgressHud()
    hud.show(view: self.view)

## Example

    import UIKit
    import SwiftyProgressHud

    class ViewController: UIViewController {
        var hud: SwiftyProgressHud!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            hud = SwiftyProgressHud()
        }
    
        func showHud() {
            hud.text = "Loading"
            hud.show(view: self.view)
        }
    
        func hideHud() {
            hud.hide()
        }
    }

## Author

AtifNaveed, atif.gcucs@gmail.com

## License

SwiftyProgressHud is available under the MIT license. See the LICENSE file for more info.
