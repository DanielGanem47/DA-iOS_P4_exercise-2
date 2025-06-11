import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.picture.large)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text("\(user.name.first) \(user.name.last)")
                    .font(.headline)
                Text("\(user.dob.date)")
                    .font(.subheadline)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("\(user.name.first) \(user.name.last)")
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userResponse = UserListResponse.User(
            name: UserListResponse.User.Name(title: "Mr", first: "John", last: "Doe"),
            dob: UserListResponse.User.Dob(date: "1990-01-01", age: 30),
            picture: UserListResponse.User.Picture(
                large: "https://randomuser.me/api/portraits/men/4.jpg",
                medium: "https://randomuser.me/api/portraits/med/men/4.jpg",
                thumbnail: "https://randomuser.me/api/portraits/thumb/men/4.jpg"
            )
        )
        let user = User(user: userResponse)
        return UserDetailView(user: user)
    }
}
