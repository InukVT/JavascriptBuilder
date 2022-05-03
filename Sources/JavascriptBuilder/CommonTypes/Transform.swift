public struct Transform <From, To>: ExpressibleByStringLiteral {
    let expression: String
    public init(stringLiteral value: String) {
        expression = value
    }
}

public extension Transform where From : HasJson {
    static func json() -> Transform<From, JSON> {
        "value => value.json()"
    }
}

public extension Transform where From : HasArrayBuffer {
    static func arrayBuffer() -> Transform<From, ArrayBuffer> {
        "value => value.json()"
    }
}
