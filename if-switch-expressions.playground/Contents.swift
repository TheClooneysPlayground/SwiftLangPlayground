let enabled = true

let greeting = if enabled {
    "Hello, World!"
} else {
    "Playground closed..."
}

enum WeekendDay: String, CaseIterable {
    case saturday
    case sunday
}

let weekendDay: WeekendDay = .saturday
let theOtherWeekendDay: WeekendDay = switch weekendDay {
    case .saturday:
            .sunday
    case .sunday:
            .saturday
}

print(greeting)
print(theOtherWeekendDay)

