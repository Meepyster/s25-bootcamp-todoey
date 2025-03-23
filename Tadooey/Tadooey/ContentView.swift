import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    @State private var todos: [Todo] = []

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.80, green: 0.1, blue: 0.3),  // Vibrant Red
                    Color(red: 0.30, green: 0.05, blue: 0.14) // Soft Pink
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
                .ignoresSafeArea()

            VStack {
                HStack {
                    Text("Todoey")
                        .font(.system(size: 60).bold())
                        .foregroundStyle(.white)
                    Spacer()
                        .frame(width: 170)
                }

                List {
                    ForEach($todos) { $todo in
                        HStack {
                            Button(action: {
                                todo.isDone.toggle()
                            }) {
                                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width:20, height: 20)
                                
                            }
                            TextField("Enter Todo", text: $todo.item)
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        }
                        .listRowBackground(Color.red.opacity(0.0))
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.black.opacity(0.0))

                HStack {
                    Button(action: {
                        todos.append(Todo(item: "", isDone: false))
                    }) {
                        Label("New Todo", systemImage: "plus.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                    }
                    Spacer()
                        .frame(width: 150)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

