//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Kunal Tyagi on 08/10/23.
//  Copyright © 2023 Microsoft. All rights reserved.
//

@testable import Minutes
import XCTest

final class MinutesTests: XCTestCase {
    var sut: Entry!
    
    override func setUpWithError() throws {
        sut = Entry("Title", "Content")
    }

    func testSerialization() throws {
        let serializedData = try XCTUnwrap(FileEntryStore.serialize(sut))
        let entry = FileEntryStore.deserialize(serializedData)
        
        XCTAssertEqual(entry?.title, "Title")
        XCTAssertEqual(entry?.content, "Content")
    }

}
