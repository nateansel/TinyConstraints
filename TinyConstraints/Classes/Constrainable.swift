//
//    MIT License
//
//    Copyright (c) 2017 Robert-Hein Hooijmans <rh.hooijmans@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.

import UIKit

extension UIView: Constrainable {}
@available(iOS 9.0, *)
extension UILayoutGuide: Constrainable {}

public protocol Constrainable {
    @available(iOS 9.0, *)
    var topAnchor: NSLayoutYAxisAnchor { get }
    @available(iOS 9.0, *)
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    @available(iOS 9.0, *)
    var leftAnchor: NSLayoutXAxisAnchor { get }
    @available(iOS 9.0, *)
    var rightAnchor: NSLayoutXAxisAnchor { get }
    @available(iOS 9.0, *)
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    @available(iOS 9.0, *)
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    
    @available(iOS 9.0, *)
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    @available(iOS 9.0, *)
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    
    @available(iOS 9.0, *)
    var widthAnchor: NSLayoutDimension { get }
    @available(iOS 9.0, *)
    var heightAnchor: NSLayoutDimension { get }
}
