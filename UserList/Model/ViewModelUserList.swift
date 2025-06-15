//
//  ModelView.swift
//  UserList
//
//  Created by daniel ganem on 03/06/2025.
//

import Foundation

final class ViewModelUserList: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published var isLoading = false
    @Published var isGridView: Bool = false
    
    private let repository: UserListRepository
    
    // MARK: Initialisation
    init(repository: UserListRepository = UserListRepository()) {
        self.repository = repository
    }

    func shouldLoadMoreData(currentItem item: User) -> Bool {
        guard let lastItem = users.last else { return false }
        return !isLoading && item.id == lastItem.id
    }

    // MARK: Loading
    @MainActor
    func fetchUsers() async {
        isLoading = true
        do {
            let users = try await repository.fetchUsers(quantity: 20)
            self.users.append(contentsOf: users)
            isLoading = false
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func reloadUsers() async {
        users.removeAll()
        await fetchUsers()
    }
}
