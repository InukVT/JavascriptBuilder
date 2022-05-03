import XCTest
@testable import JavascriptBuilder

final class JavascriptBuilderTests: XCTestCase {    
    func testFetch() throws {
        let helloRequest = fetch(literal: "Hello")
        let fetchJson = helloRequest
            .map(.json())
        
        let jsonExpression = JavaSciptExpression(promise: fetchJson)
        
        XCTAssertEqual(jsonExpression.render(), "fetch(\"Hello\").then(value => value.json())")
        
        let fetchBuffer = helloRequest
            .map(.arrayBuffer())
        
        let bufferExpression = JavaSciptExpression(promise: fetchBuffer)
        
        XCTAssertEqual(bufferExpression.render(), "fetch(\"Hello\").then(value => value.json())")
    }
    
    func testFunctions() throws {
        let function = "url" => {
            constant(
                name: "json",
                promise: fetch(url: "url")
                .map(.json())
            )
            constant(
                name: "buffer",
                promise: fetch(url: "url")
                .map(.arrayBuffer())
            )
        }
        
        XCTAssertEqual(function.expression.render(), """
url => {
let json = fetch(url).then(value => value.json());
let buffer = fetch(url).then(value => value.json())
}
""")
    }
}
