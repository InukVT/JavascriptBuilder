public struct JavaScriptFunction {
    let expression: JavaSciptExpression
    
    init(paramter: String, expression: JavaSciptExpression) {
        let jsParameter = JavaSciptExpression(raw:  paramter + " => {\n" )
        let end = JavaSciptExpression(raw: "\n}" )
        self.expression = jsParameter + expression + end
    }
}

infix operator => : AdditionPrecedence
public func => (paramter: String, @ExpressionBuilder expression: () -> JavaSciptExpression) -> JavaScriptFunction {
    .init(paramter: paramter, expression: expression())
}
