// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Combine

@propertyWrapper
struct Broadcast<Value> {
    private var publisher: CurrentValueSubject<Value, Never>
    var wrappedValue: Value {
        didSet {
            self.publisher.send(wrappedValue)
        }
    }
    var projectedValue: AnyPublisher<Value, Never> {
        return publisher.eraseToAnyPublisher()
    }

    init(wrappedValue: Value) {
        self.publisher = CurrentValueSubject(wrappedValue)
        self.wrappedValue = wrappedValue
    }
}
