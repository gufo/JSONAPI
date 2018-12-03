//
//  Relationship+LiteralTests.swift
//  JSONAPITests
//
//  Created by Mathew Polzin on 11/27/18.
//

import XCTest
import JSONAPI
import JSONAPITestLib

class Relationship_LiteralTests: XCTestCase {

	func test_NilLiteral() {
		XCTAssertEqual(ToOneRelationship<TestEntity?>(id: nil), nil)
	}

	func test_ArrayLiteral() {
		XCTAssertEqual(ToManyRelationship<TestEntity>(ids: ["1", "2", "3"]), ["1", "2", "3"])
	}

	func test_StringLiteral() {
		XCTAssertEqual(ToOneRelationship<TestEntity>(id: "123"), "123")
		XCTAssertEqual(ToOneRelationship<TestEntity?>(id: "123"), "123")
	}
}

// MARK: - Test types
extension Relationship_LiteralTests {
	enum TestDescription: EntityDescription {
		public static var type: String { return "test" }

		public typealias Attributes = NoAttributes
		public typealias Relationships = NoRelationships
	}

	typealias TestEntity = BasicEntity<TestDescription>
}
