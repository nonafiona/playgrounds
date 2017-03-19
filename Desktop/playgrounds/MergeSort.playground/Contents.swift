
import UIKit

// MARK: Overview of Merge Sort Logic
// split items up & merge them altogether after

// split that into two piles
// keep splitting the piles into two until you can't anymore
// begin merging by pairing items together


// MARK: Splitting

// * computer thinking *
// given a list of values:
// [ a, b, c, d, e ]

// [a, b] [c, d, e]
// [a] [b] [c] [d,e]    // can't split a & b any further,
                        // splits first item, (c), of triplet off
// [a] [b] [c] [d] [e]  // all items have their own individual piles

// MARK: Merging
// merge the piles together while sorting

// * computer thinking *
// given this list of values:
// [2] [1] [5] [4] [9]

// [1, 2] [4, 5] [9] // merge & sort
// [1, 2, 4, 5] [9]  // merge some more
// [1, 2, 4, 5, 9]   // merge finalized

// MARK: Bottom-Up Implementation
// the difference here is: you can merge immeadiately without an extra step.
// what the heck are these naming conventions?
// TODO: change poorly named variables.

func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> T {
    let n = a.count
    
    var z = [a, a]
    var d = 0
    
    var width = 1
    
    while width < n {
        
        var i = 0
        
        while i < n {
            
            var j = i // var j ??? seriously??? what does this mean???
            var l = i
            var r = i + width
            
            let lmax = min(l + width, n)
            let rmax = min(r + width, n)
            
            while l < lmax && r < rmax {
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1-d][j] = z[d][l]
                    l += 1
                } else {
                    z[1-d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1 - d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }
            
            i += width*2
        }
        width *= 2
        d = 1 - d
    }
    return z[d] as! T
}


// MARK: Top-Down Implementation

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2 // basically finding the median
    
    let leftArray = mergeSort(Array(array[0..<middleIndex])) // splits left up until middleIndex
    let rightArray = mergeSort(Array(array[middleIndex..<array.count])) // splits right from middleIndex to end of array
    
    return merge(leftPile: leftArray, rightPile: rightArray)
    
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    
    // MARK: setup the indexes
    var leftIndex = 0
    var rightIndex = 0
    
    // MARK: set up the ordered pile
    var orderedPile = [Int]()
    
    // MARK: appends items into a list while keeping the order
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        
        // if the left index is less than the right:
        if leftPile[leftIndex] < rightPile[rightIndex] {
            
            orderedPile.append(leftPile[leftIndex]) // append to the orderedPile
            leftIndex += 1
        
        // if the left index is more than the right:
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            
            orderedPile.append(rightPile[rightIndex]) // append to the orderedPile
            rightIndex += 1
            
        } else {
            
            // append anyway
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
            
        }
    }
    
    // MARK: Everything has been sorted into orderedPile
    //       Now, just append to the end of the list
    
    while leftIndex < leftPile.count {
        
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}