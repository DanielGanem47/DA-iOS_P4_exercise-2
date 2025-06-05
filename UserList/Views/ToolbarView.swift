//
//  ToolbarView.swift
//  UserList
//
//  Created by daniel ganem on 04/06/2025.
//

import Foundation
import SwiftUI

public struct ToolbarView: ToolbarContent {
    @ObservedObject var viewModel: ViewModelUserList
    
    init(viewModel: ViewModelUserList) {
        self.viewModel = viewModel
    }
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Picker(selection: $viewModel.isGridView, label: Text("Display")) {
                Image(systemName: "rectangle.grid.1x2.fill")
                    .tag(true)
                    .accessibilityLabel(Text("Grid view"))
                Image(systemName: "list.bullet")
                    .tag(false)
                    .accessibilityLabel(Text("List view"))
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                viewModel.reloadUsers()
            }) {
                Image(systemName: "arrow.clockwise")
                    .imageScale(.large)
            }
        }
    }
}
