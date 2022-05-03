public func constant(name: String, expression: JavaSciptExpression) -> JavaSciptExpression {
    let variable = JavaSciptExpression(raw: "let \(name) = ")
    return variable + expression
}
public func constant<T>(name: String, promise: Promise<T>) -> JavaSciptExpression {
    constant(name: name, expression: promise.raw)
}
