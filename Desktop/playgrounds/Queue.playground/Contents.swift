// Queue 

// What is a Queue? 

// a list that only allows:
// insertion of items at the back
// removal of items at the front

// Why use a Queue? 
// Services that require FIFO (first in, first out) 
// a.k.a. storing a ton of tumblr posts you want to post
// periodically in the future
// OR:
// a waiting line for customer service
// (a.k.a. the horror of the DMV)

// So what does the final product look like?

// queue.enqueue(10) <- enqueue adds the number 10 to the end of the list
// the queue now looks like this: 
// [ 10 ]

// queue.enqueue(3)
// [ 10 , 3 ] 

// queue.enqueue(57)
// [ 10, 3, 57 ] 

// queue.dequeue()
// returns 10 <-- since it's the first item in the list

// queue.dequeue()
// returns 3 <-- since it's now the first item in the list

// * * * * * * * * * * * * * * * * * * * * * * * * * * * *

// MARK: Basic Implementation - Not Optimal 
// O(1) Worst Case

// representation of a queue's memory in this version: 

// [ "fiona", "fanisa", "julia", "miriam", xxx, xxx ]
//    head ^

public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty // returns a true or false value for the contents of the list
    }
    
    public var count: Int {
        return array.count // returns the # of items in the array
    }
    
    // MARK: our simple enqueue method
    public mutating func enqueue(_ element: T) {
        array.append(element) // adds item to the end of the list
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil // checks if the list is empty
        } else {
            return array.removeFirst() // otherwise, removes the first element in the list
        }
    }
    
    public var front: T? {
        return array.first // returns the first item in the array
    }
}

// MARK: Better Implementation - More Optimal 
// O(n) - Worst Case

// representation of a queue's memory in this version:

// [ xxx, "fiona", "fanisa", "julia", "miriam", xxx, xxx ]
//         head ^

public struct BetterQueue<T> {
    fileprivate var array = [T?]() // use an optional to check if an item is there or not
    fileprivate var head = 0       // head is the index of the front-most object
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        // calculates percentage of empty spots at the beginning as a ratio of total array size
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            // if more than 25% of the array space is unused, chop it off
            array.removeFirst()
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

// MARK: testing it out

var q = BetterQueue<String>()

q.array

q.enqueue("fiona")
q.enqueue("fanisa")
q.enqueue("julia")
q.enqueue("miriam")

q.dequeue()
q.array
q.count

q.enqueue("shannon")
q.array

q.dequeue()
q.array
q.count

