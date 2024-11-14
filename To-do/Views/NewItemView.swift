//
//  NewItemView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresentedBool: Bool

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.top, 50)

            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField(
                    "Description (Optional)", text: $viewModel.description
                )
                .textFieldStyle(DefaultTextFieldStyle())

                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())

                TLButtonView(buttonName: "Save", buttonColor: .orange) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresentedBool = false
                    } else {
                        viewModel.showAlert = true
                    }
                }.padding()
            }.alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(
                        "Please fill title and select a due date that is today or newer."
                    ))
            }
        }
    }
}

#Preview {
    NewItemView(
        newItemPresentedBool: Binding(
            get: {
                return true
            },
            set: { _ in
            }))
}
