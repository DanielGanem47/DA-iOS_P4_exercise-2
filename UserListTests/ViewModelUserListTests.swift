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

    func testIsEmpty() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // Then
        XCTAssertEqual(viewModel.users.count, 0)
    }

    func testFetchUsers() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // When
        await viewModel.fetchUsers()

        // Then
        XCTAssertEqual(viewModel.users.count, 2)
    }

    func testShouldLoadMoreData() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // When
        await viewModel.fetchUsers()

        // Then
        XCTAssertFalse(viewModel.shouldLoadMoreData(currentItem: viewModel.users[0]))
    }

    func testReloadUsers() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // When
        await viewModel.reloadUsers()

        // Then
        XCTAssertFalse(viewModel.shouldLoadMoreData(currentItem: viewModel.users[0]))
    }
}
