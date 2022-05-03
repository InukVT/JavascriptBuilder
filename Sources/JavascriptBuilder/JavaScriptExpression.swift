public struct JavaSciptExpression: ExpressibleByStringLiteral {
    internal let expression: String
    public init(stringLiteral value: String) {
        expression = value
    }
    
    public init(raw: String) {
        expression = raw
    }
    
    public init<T>(promise: Promise<T>) {
        self = promise.raw
    }
    
    func render() -> String {
        return expression
    }
}

func +(this: JavaSciptExpression, other: JavaSciptExpression) -> JavaSciptExpression {
    .init(stringLiteral: this.expression + other.expression)
}
