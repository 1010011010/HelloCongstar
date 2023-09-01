import Foundation

@testable import HelloCongstar
import XCTest

class URLExtensionsTests: XCTestCase {
    
    func testAppendQueryItem() {
        // Given
        let url = NSURL(string: "https://example.com")!
        
        // When
        let newURL = url.appendingQueryItem(withName: "key", value: "value")
        
        // Then
        XCTAssertEqual(newURL.absoluteString, "https://example.com?key=value")
    }
    
    func testAppendQueryItemWhenExistingQuery() {
        // Given
        let url = NSURL(string: "https://example.com?existingKey=existingValue")!
        
        // When
        let newURL = url.appendingQueryItem(withName: "key", value: "value")
        
        // Then
        XCTAssertEqual(newURL.absoluteString, "https://example.com?existingKey=existingValue&key=value")
    }
    
    func testAppendQueryItemWithNilValue() {
        // Given
        let url = NSURL(string: "https://example.com")!
        
        // When
        let newURL = url.appendingQueryItem(withName: "key", value: nil)
        
        // Then
        XCTAssertEqual(newURL.absoluteString, "https://example.com?key")
    }
}

