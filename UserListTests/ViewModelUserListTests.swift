//
//  ViewModelUserListTests.swift
//  UserListTests
//
//  Created by daniel ganem on 05/06/2025.
//

import Testing
@testable import UserList

struct ViewModelUserListTests {
    @Test func isEmpty() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // Then
        #expect(viewModel.users.count == 0)
    }

    @Test func fetchUsers() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // When
        await viewModel.fetchUsers()

        // Then
        #expect(viewModel.users.count == 2)
    }

    @Test func shouldLoadMoreData() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // When
        await viewModel.fetchUsers()

        // Then
        #expect(viewModel.shouldLoadMoreData(currentItem: viewModel.users[0]) == false)
    }

    @Test func reloadUsers() async throws {
        // Given
        let viewModel: ViewModelUserList = ViewModelUserList(repository: UserListRepository.mock())

        // When
        await viewModel.reloadUsers()

        // Then
        #expect(viewModel.users.count == 2)
    }
}
