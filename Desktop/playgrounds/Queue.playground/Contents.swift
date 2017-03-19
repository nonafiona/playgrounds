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

// MARK: Basic Implementation 

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

