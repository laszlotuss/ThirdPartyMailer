//
//  ContentView.swift
//  ThirdPartyMailerExampleSwiftUI
//
//  Created by Tuss László on 2023. 07. 08..
//

import SwiftUI
import ThirdPartyMailer

struct ContentView: View {
    
    let clients = ThirdPartyMailClient.clients
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    Button {
                        ThirdPartyMailer.openCompose(.systemDefault, subject: "Test ThirdPartyMailer")
                    } label: {
                        HStack {
                            Text(ThirdPartyMailClient.systemDefault.name)
                            Spacer()
                            if ThirdPartyMailer.isMailClientAvailable(.systemDefault) {
                                Text("Available")
                                    .foregroundColor(.accentColor)
                            } else {
                                Text("Unavailable")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                
                Section {
                    ForEach(clients) { client in
                        Button {
                            ThirdPartyMailer.openCompose(client, subject: "Test ThirdPartyMailer")
                        } label: {
                            HStack {
                                Text(client.name)
                                Spacer()
                                if ThirdPartyMailer.isMailClientAvailable(client) {
                                    Text("Available")
                                        .foregroundColor(.accentColor)
                                } else {
                                    Text("Unavailable")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
                
            }
            .navigationViewStyle(.stack)
            .navigationTitle("Third Party Mailer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ThirdPartyMailClient: Identifiable {
    public var id: String {
        URLScheme
    }
}
