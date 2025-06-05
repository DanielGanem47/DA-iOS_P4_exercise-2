import SwiftUI

struct UserListView: View {
    @ObservedObject private var viewModel: ViewModelUserList = ViewModelUserList()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(2.0, anchor: .center)
            } else {
                if !viewModel.isGridView {
                    List(viewModel.users) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            UserViewRow(user: user)
                        }
                    }
                    .navigationTitle("Users")
                    .toolbar {
                        ToolbarView(viewModel: viewModel)
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(viewModel.users) { user in
                                NavigationLink(destination: UserDetailView(user: user)) {
                                    UserViewCircle(user: user)
                                }
                            }
                        }
                    }
                    .navigationTitle("Users")
                    .toolbar {
                        ToolbarView(viewModel: viewModel)
                    }
                }
            }
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
