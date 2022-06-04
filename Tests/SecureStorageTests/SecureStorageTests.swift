//
//  SecureStorageTests.swift
//  UtilityComponents/Tests
//
//  Created by Douglas Adams on 5/12/22.
//


import XCTest
@testable import SecureStorage

class SecureStorageTests: XCTestCase {
  let account = "someAccount"
  
  let secureStore = SecureStore(service: "SomeServiceName")
  
  func testStorage() {

    XCTAssert( secureStore.set(account: account, data: "abcdefghijklmnopqrstuvwxyz1234567890") == true )

    XCTAssert( secureStore.get(account: account) == "abcdefghijklmnopqrstuvwxyz1234567890")
    
    XCTAssert( secureStore.delete(account: account) == true )

    XCTAssert( secureStore.get(account: account) == nil)

  }
}
