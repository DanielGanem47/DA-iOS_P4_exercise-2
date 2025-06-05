//
//  ViewModelUserListTests.swift
//  UserListTests
//
//  Created by daniel ganem on 05/06/2025.
//

import Testing
import XCTest
@testable import UserList

final class ViewModelUserListTests: XCTestCase {

    func testCount() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList()

        // Then
        XCTAssertEqual(viewModel.users.count, 0)
    }

    func testFetchUsers() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList()

        // When
        viewModel.fetchUsers()
        while viewModel.isLoading {}

        // Then
        XCTAssertFalse(viewModel.users.count == 0)
    }

    func testShouldLoadMoreData() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList()

        // When
        viewModel.fetchUsers()
        while viewModel.isLoading {}

        // Then
        XCTAssertFalse(viewModel.shouldLoadMoreData(currentItem: viewModel.users[0]))
    }

    func testReloadUsers() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList()

        // When
        viewModel.reloadUsers()
        while viewModel.isLoading {}

        // Then
        XCTAssertFalse(viewModel.shouldLoadMoreData(currentItem: viewModel.users[0]))
    }
}
