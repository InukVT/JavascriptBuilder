public struct Promise<T> {
    internal let raw: JavaSciptExpression
    
    public init(raw: JavaSciptExpression) {
        self.raw = raw
    }
    
    public func map(_ expression: JavaSciptExpression) -> Promise<JavaSciptExpression> {
        Promise<JavaSciptExpression>(raw: raw + JavaSciptExpression(raw: ".then(\(expression))"))
    }
    
    public func map<To>(_ transform: Transform<T, To>) -> Promise<To>{
        Promise<To>(raw: raw + JavaSciptExpression(raw: ".then(\(transform.expression))"))
    }
}
