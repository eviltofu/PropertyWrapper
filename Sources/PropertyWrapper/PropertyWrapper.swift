// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Combine

@propertyWrapper
public struct Broadcast<Value> {
    private var publisher: CurrentValueSubject<Value, Never>
    public var wrappedValue: Value {
        didSet {
            self.publisher.send(wrappedValue)
        }
    }
    public var projectedValue: AnyPublisher<Value, Never> {
        return publisher.eraseToAnyPublisher()
    }

    public init(wrappedValue: Value) {
        self.publisher = CurrentValueSubject(wrappedValue)
        self.wrappedValue = wrappedValue
    }
}
