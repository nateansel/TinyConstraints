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
//

import UIKit

public extension UIView {
    
    @discardableResult
    public func stack(_ views: [UIView], axis: ConstraintAxis = .vertical, width: CGFloat? = nil, height: CGFloat? = nil, spacing: CGFloat = 0) -> Constraints {
        
        var offset: CGFloat = 0
        var previous: UIView?
        var constraints: Constraints = []
        
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            
            switch axis {
            case .vertical:
                constraints.append(view.top(to: previous ?? self, (previous != nil) ? .bottom : .top, offset: offset))
                constraints.append(view.left(to: self, .left))
                constraints.append(view.right(to: self, .right))
                
                if let lastView = views.last, view == lastView {
                    constraints.append(view.bottom(to: self, .bottom))
                }
            case .horizontal:
                constraints.append(view.top(to: self, .top))
                constraints.append(view.bottom(to: self, .bottom))
                constraints.append(view.left(to: previous ?? self, (previous != nil) ? .right : .left, offset: offset))
                
                if let lastView = views.last, view == lastView {
                    constraints.append(view.right(to: self, .right))
                }
            }
            
            if let width = width {
                constraints.append(view.width(width))
            }
            
            if let height = height {
                constraints.append(view.height(height))
            }
            
            offset = spacing
            previous = view
        }
        
        return constraints
    }
}
