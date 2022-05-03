@resultBuilder
public struct ExpressionBuilder {
    public static func buildBlock(_ components: JavaSciptExpression...) -> JavaSciptExpression {
        JavaSciptExpression(raw: components.map(\.expression).joined(separator: ";\n") )
    }
}
