//: Playground - noun: a place where people can play

// Tree Node Class

public class TreeNode<T> {
    
    public var value: T
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<T>) {
        children.append(node) // appending child node to array
        node.parent = self // references the class
    }
}

// description extension: easier to distinguish which node is which
extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children .isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + " }"
        }
        return s
    }
}


// creating the tree descriptions

let tree = TreeNode<String>(value: "beverages") // root node acting as general category

let hotNode = TreeNode<String>(value: "hot")
let coldNode = TreeNode<String>(value: "cold")

let teaNode = TreeNode<String>(value: "tea")
let coffeeNode = TreeNode<String>(value: "coffee")
let chocolateNode = TreeNode<String>(value: "cocoa")

let blackTeaNode = TreeNode<String>(value: "black")
let greenTeaNode = TreeNode<String>(value: "green")
let earlGreyTeaNode = TreeNode<String>(value: "earl grey")
let mintTeaNode = TreeNode<String>(value: "mint")

let sodaNode = TreeNode<String>(value: "soda")
let fizzyNode = TreeNode<String>(value: "fizzy water")
let milkNode = TreeNode<String>(value: "milk")

let gingerAleNode = TreeNode<String>(value: "ginger ale")
let spriteNode = TreeNode<String>(value: "sprite")
let fantaNode = TreeNode<String>(value: "fanta orange")

let lemonLacroixNode = TreeNode<String>(value: "lemon la croix")
let limeLacroixNode = TreeNode<String>(value: "lime la croix")
let peachLacroixNode = TreeNode<String>(value: "peach la croix")
let plainFizzyNode = TreeNode<String>(value: "plain fizzy water")

// adding the nodes correctly to the tree

// root node already defined above

// 2nd level categories: hot & cold

tree.addChild(hotNode)
tree.addChild(coldNode)

// 3rd level category: hot drink types

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

// 3rd level category: cold drink types

coldNode.addChild(sodaNode)
coldNode.addChild(fizzyNode)
coldNode.addChild(milkNode)

// 4th level category: tea types

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(earlGreyTeaNode)
teaNode.addChild(mintTeaNode)

// 4th level category: soda types

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(spriteNode)
sodaNode.addChild(fantaNode)

// 4th level category: fizzy water types

fizzyNode.addChild(lemonLacroixNode)
fizzyNode.addChild(limeLacroixNode)
fizzyNode.addChild(peachLacroixNode)
fizzyNode.addChild(plainFizzyNode)

print(tree)

// search function

extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}

// search results 

tree.search("cocoa") // available
tree.search("mint")  // available
tree.search("lemon la croix") // available

tree.search("chai") // nil
































