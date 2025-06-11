//
//  RoundUserView.swift
//  UserList
//
//  Created by daniel ganem on 03/06/2025.
//

import SwiftUI

struct UserViewCircle: View {
    let user: User
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.picture.medium)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            }
            
            Text("\(user.name.first) \(user.name.last)")
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}

struct UsrViewCircle_Previews: PreviewProvider {
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
        return UserViewCircle(user: user)
    }
}
