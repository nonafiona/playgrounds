// Binary Search

// MARK: What is a Binary Search? 

// a more efficient way of searching an array
// as a opposed to a linear search, which loops through an entire array
// binary search splits a sorted array in half continuously until it finds 
// the given item, a search key. If we split until we can't split any smaller,
// and we haven't yet to find the search key, we can assume that the search key
// isn't inside the array :(

// MARK: Why use Binary Search? 

// It's much faster than linear search and the worst case is a lot better. 
// Binary Search has O(log n) while linear search O(1)

// MARK: Basic Implementation - Iterative

func binarySearch<T: Comparable>(a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        
        // If we get here, then the search key is not present in the array
        return nil
        
    } else {
        
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)
        
        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a: a, key: key, range: range.lowerBound..<midIndex)
            
        // Is the search key is the right half?
        } else if a[midIndex] < key {
            
            return binarySearch(a: a, key: key, range: midIndex + 1..<range.upperBound)
            
        // If we get here, we've found the search key!
        } else {
            
            return midIndex
        }
    
    }
}

// MARK: Better Implementation - Recursive 

func betterBinarySearch<T: Comparable>(a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound)/2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}


let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

binarySearch(numbers, key: 43)  // gives 13
