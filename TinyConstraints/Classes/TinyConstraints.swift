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

public extension Constrainable {
    
    @discardableResult
    public func center(in view: Constrainable, offset: CGPoint = .zero, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraints {
        let constraints = [
            NSLayoutConstraint(
                item: self,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: offset.x)
                .with(priority),
            NSLayoutConstraint(
                item: self,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: offset.y)
                .with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
		
        return constraints
    }
    
    @discardableResult
    public func edges(to view: Constrainable, insets: UIEdgeInsets = .zero, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraints {
        let constraints = [
            NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: .equal,
                toItem: view,
                attribute: .top,
                multiplier: 1,
                constant: insets.top)
                .with(priority),
            NSLayoutConstraint(
                item: self,
                attribute: .leading,
                relatedBy: .equal,
                toItem: view,
                attribute: .leading,
                multiplier: 1,
                constant: insets.left)
                .with(priority),
            NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: view,
                attribute: .bottom,
                multiplier: 1,
                constant: insets.bottom)
                .with(priority),
            NSLayoutConstraint(
                item: self,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: view,
                attribute: .trailing,
                multiplier: 1,
                constant: insets.right)
                .with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func size(_ size: CGSize, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraints {
        let constraints = [
            NSLayoutConstraint(
                item: self,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .width,
                multiplier: 1,
                constant: size.width)
                .with(priority),
            NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .height,
                multiplier: 1,
                constant: size.height)
                .with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func width(_ width: CGFloat, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .width,
                multiplier: 1,
                constant: width)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func width(to view: Constrainable, _ attribute: NSLayoutAttribute = .width, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .width,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func width(min: CGFloat? = nil, max: CGFloat? = nil, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraints {
        var constraints: Constraints = []
        
        if let min = min {
            let constraint =
                NSLayoutConstraint(
                    item: self,
                    attribute: .width,
                    relatedBy: .greaterThanOrEqual,
                    toItem: nil,
                    attribute: .width,
                    multiplier: 1,
                    constant: min)
                    .with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        if let max = max {
            let constraint =
                NSLayoutConstraint(
                    item: self,
                    attribute: .width,
                    relatedBy: .lessThanOrEqual,
                    toItem: nil,
                    attribute: .width,
                    multiplier: 1,
                    constant: max)
                    .with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        return constraints
    }
    
    @discardableResult
    public func height(_ height: CGFloat, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .height,
                multiplier: 1,
                constant: height)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func height(to view: Constrainable, _ attribute: NSLayoutAttribute = .height, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func height(min: CGFloat? = nil, max: CGFloat? = nil, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraints {
        var constraints: Constraints = []
        
        if let min = min {
            let constraint =
                NSLayoutConstraint(
                    item: self,
                    attribute: .height,
                    relatedBy: .greaterThanOrEqual,
                    toItem: nil,
                    attribute: .height,
                    multiplier: 1,
                    constant: min)
                    .with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        if let max = max {
            let constraint =
                NSLayoutConstraint(
                    item: self,
                    attribute: .height,
                    relatedBy: .lessThanOrEqual,
                    toItem: nil,
                    attribute: .height,
                    multiplier: 1,
                    constant: max)
                    .with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        return constraints
    }
    
    @discardableResult
    public func leading(to view: Constrainable, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .leading,
                relatedBy: .equal,
                toItem: view,
                attribute: .leading,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func left(to view: Constrainable, _ attribute: NSLayoutAttribute = .left, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .left,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func left(lessThan view: Constrainable, _ attribute: NSLayoutAttribute = .left, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .left,
                relatedBy: .lessThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func left(greaterThan view: Constrainable, _ attribute: NSLayoutAttribute = .left, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .left,
                relatedBy: .greaterThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func trailing(to view: Constrainable, _ attribute: NSLayoutAttribute = .trailing, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func right(to view: Constrainable, _ attribute: NSLayoutAttribute = .right, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .right,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func right(lessThan view: Constrainable, _ attribute: NSLayoutAttribute = .right, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .right,
                relatedBy: .lessThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func right(greaterThan view: Constrainable, _ attribute: NSLayoutAttribute = .right, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .right,
                relatedBy: .greaterThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func top(to view: Constrainable, _ attribute: NSLayoutAttribute = .top, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func top(lessThan view: Constrainable, _ attribute: NSLayoutAttribute = .top, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: .lessThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func top(greaterThan view: Constrainable, _ attribute: NSLayoutAttribute = .top, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .top,
                relatedBy: .greaterThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(to view: Constrainable, _ attribute: NSLayoutAttribute = .bottom, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(lessThan view: Constrainable, _ attribute: NSLayoutAttribute = .bottom, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .lessThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(greaterThan view: Constrainable, _ attribute: NSLayoutAttribute = .bottom, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .greaterThanOrEqual,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerX(to view: Constrainable, _ attribute: NSLayoutAttribute = .centerX, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerY(to view: Constrainable, _ attribute: NSLayoutAttribute = .centerY, offset: CGFloat = 0, priority: ConstraintPriority = .high, isActive: Bool = true) -> Constraint {
        let constraint =
            NSLayoutConstraint(
                item: self,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: offset)
                .with(priority)
        constraint.isActive = isActive
        return constraint
    }
}

public extension UIView {
    
    public func setHugging(_ priority: ConstraintPriority, for axis: ConstraintAxis) {
        setContentHuggingPriority(priority.value, for: axis)
    }
    
    public func setCompressionResistance(_ priority: ConstraintPriority, for axis: ConstraintAxis) {
        setContentCompressionResistancePriority(priority.value, for: axis)
    }
}
