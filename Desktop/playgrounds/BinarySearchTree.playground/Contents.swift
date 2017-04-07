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
    
    // traversal method
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
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


// Enum Implementation

