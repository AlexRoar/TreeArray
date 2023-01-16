import Foundation
import TreeArray

extension Sequence {
    func kalimbaOrdered() -> TreeArray<Element> {
        var kalimba: TreeArray<Element> = []
        kalimba.reserveCapacity(underestimatedCount)
        var insertAtStart = false
        for element in self {
            if insertAtStart {
                kalimba.insert(element, at: 0)
            } else {
                kalimba.append(element)
            }
            insertAtStart.toggle()
        }
        return kalimba
    }

    func kalimbaOrdered3() -> TreeArray<Element> {
        var odds: TreeArray<Element> = []
        var evens: TreeArray<Element> = []
        odds.reserveCapacity(underestimatedCount)
        evens.reserveCapacity(underestimatedCount / 2)
        var insertAtStart = false
        for element in self {
            if insertAtStart {
                odds.append(element)
            } else {
                evens.append(element)
            }
            insertAtStart.toggle()
        }
        odds.reverse()
        odds.append(contentsOf: evens)
        return odds
    }
}

@inline(never)
public func blackHole<T>(_ value: T) {
}

let testSize = 100000000
var arr = TreeArray(Array(0...testSize))
for i in arr {
    blackHole(i)
}
