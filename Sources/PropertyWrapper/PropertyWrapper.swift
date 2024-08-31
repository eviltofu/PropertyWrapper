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

@propertyWrapper
public struct UppercaseString {
    private var _string: String 
    public var wrappedValue: String {
        get {
            _string
        }
        set {
            _string = newValue.uppercased()
        }
    }
    public init(wrappedValue: String) {
        _string = wrappedValue.uppercased()
    }
}

@propertyWrapper
public struct LowercaseString {
    private var _string: String
    public var wrappedValue: String {
        get {
            _string
        }
        set {
            _string = newValue.lowercased()
        }
    }
    public init(wrappedValue: String) {
        _string = wrappedValue.lowercased()
    }
}

@propertyWrapper
public struct Ranged<T: Comparable> {
    private var _upper: T
    private var _lower: T
    private var _value: T
    public var wrappedValue: T {
        get {
            _value
        }
        set {
            self.setWrappedValue(newValue)
        }
    }
    private mutating func setWrappedValue(_ value: T) {
        if (value <= _upper) && (value >= _lower) {
            self._value = value
            return
        }
        if (value < _lower) {
            self._value = _lower
            return
        }
        if (value > _upper) {
            self._value = _upper
            return
        }
    }
    public init(wrappedValue: T, upper: T, lower: T) {
        self._lower = lower
        self._upper = upper
        self._value = wrappedValue
        self.setWrappedValue(wrappedValue)
    }
}
