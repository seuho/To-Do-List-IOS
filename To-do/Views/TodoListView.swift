//
//  TodoListItemsView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//
import FirebaseFirestore
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel : TodoListViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }.tint(Color.red)
                        }
                }
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresentedBool: $viewModel.showingNewItemView)
            }
        }
    }
}

//#Preview {
//    TodoListView(userId: "8E683578-0826-4035-82B1-8AF2D9EEB74F")
//}
