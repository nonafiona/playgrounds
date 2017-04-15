// Binary Search Tree

// OOP Implementation

// This class describes a single node, not the entire tree

public class BinarySearchTree<T: Comparable> {
    
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    // inserting nodes method
    
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        }else{
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    // search method 
    
    public func search(value: T) -> BinarySearchTree? {
        if value  < self.value {
            return left?.search(value: value) // insert on left branch
        } else if value > self.value {
            return right?.search(value: value) // insert on right branch
        } else {
            return self // found the node!
        }
    }
    
    // traversal method (in order)
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    // map method ( traverses through tree in order )
    
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
    
    // map method cont ( returns tree as a sorted array )
    public func toArray() -> [T] {
        return map { $0 }
    }
    
    // height method
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    // depth method 
    public func depth() -> Int {
        var node = self
        var edges = 0
        while case let parent? = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    // deleting nodes
    private func reconnectParentToNode(node: BinarySearchTree?){
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        
        node?.parent = parent
    }
    
    // return the maximum & minimum of a node:
    
    // minimum = leftside
    // maximum = rightside
    
    public func minimum() -> BinarySearchTree {
        var node = self
        while case let next? = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while case let next? = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        // Replacement for the current node can either be the biggest on the left 
        // Or the smallest on the right, whichever is not nil 
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        // Place the replacement on the current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentToNode(node: replacement)
        
        // the current node is no longer part of the tree, so clean it up 
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    // predescessor method 
    
    public func predecessor() -> BinarySearchTree<T>? {
        if let left = left {
            return left.maximum() // find the max value on left side
        } else {
            var node = self
            // go through parent nodes until finding a smaller value
            while case let parent? = node.parent {
                if parent.value < value { return parent }
                node = parent
            }
            return nil // return that there is no predecessor
        }
    }
    
    // successor method 
    
    public func successor() -> BinarySearchTree<T>? {
        if let right = right {
            return right.minimum() // finds the smallest value on the right
        } else {
            var node = self
            while case let parent? = node.parent {
            if parent.value > value { return parent }
            node = parent
            }
            return nil // no sucessor
        }
    }
    
    // test binary search tree is valid method
    public func isBST(minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue { return false }
        let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
    
}

// formatting output

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += "-> (\(right.description))"
        }
        return s
    }
}
    
// make a binary search tree ! 

let tree = BinarySearchTree<Int>(value: 7)
tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 1)

print(tree)

// search the tree

tree.search(value: 5)
tree.search(value: 1)
tree.search(value: 10)
tree.search(value: 3) // nil

// traversal of the tree

tree.traverseInOrder { value in print(value) }

// returns the tree back sorted using map method

tree.toArray()

// finds the height of the tree
tree.height()

// finds the depth of the tree
if let node9 = tree.search(value: 9) {
    node9.depth()
}

// checking if Binary Search Tree is valid
if let node1 = tree.search(value: 1) {
    tree.isBST(minValue: Int.min, maxValue: Int.max) // true
    node1.insert(value: 100) // got emmmmm
    tree.search(value: 100) // nil
    tree.isBST(minValue: Int.min, maxValue: Int.max) // false 😈
}



