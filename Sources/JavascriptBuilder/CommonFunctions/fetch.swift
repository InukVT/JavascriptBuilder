public func fetch(url: String) -> Promise<Response> {
    Promise(raw: JavaSciptExpression(raw: "fetch(\(url))"))
}
public func fetch(literal: String) -> Promise<Response> {
    Promise(raw: JavaSciptExpression(raw: "fetch(\"\(literal)\")"))
}
