import UIKit

var greeting = "Hello, playground"

// https://www.avanderlee.com/swift/actors/

// MARK: The Basics

actor ChickenFeeder {
    let food = "worms"
    var numberOfChickenEating = 0

    func chickenStartEating() {
        numberOfChickenEating += 1
        notifyObservers()
    }

    func chickenStopEating() {
        numberOfChickenEating -= 1
        notifyObservers()
    }
}

let feeder = ChickenFeeder()
// feeder.chickenStartEating() // Calls to instance method 'chickenStartEating()' from outside of its actor context are implicitly asynchronous

// MARK: "Concat" Suspensions Together

extension ChickenFeeder {
    func notifyObservers() {
        NotificationCenter.default.post(name: NSNotification.Name("chicken.started.eating"), object: numberOfChickenEating)
    }
}

await feeder.chickenStartEating()
await feeder.chickenStartEating()
await feeder.chickenStartEating()

await feeder.numberOfChickenEating

// MARK: nonisolated

extension ChickenFeeder {
    nonisolated func whatChickensAreEating() -> String {
        "Chickens are eating \(food)"
    }
}

feeder.whatChickensAreEating()
