//
//  ContentView.swift
//  SwiftUI Alerts
//
//  Created by Amben on 6/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsPresented = false
    @State private var backgroundUpdated = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if backgroundUpdated {
                    Color.red
                }
                else {
                    Color.blue
                }
                
                VStack {
                    Button(action: {
                        self.alertIsPresented = true
                    }, label: {
                        Text("Tap Me!")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 24))
                    })
                    .frame(width: 200, height: 50, alignment: .center)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                    .alert(isPresented: $alertIsPresented, content: {
                        Alert(title: Text("Would you like to purchase?"),
                              primaryButton: .default(Text("Purchase"), action: {
                                self.backgroundUpdated.toggle()
                              }),
                              secondaryButton: .cancel(Text("No Thanks")))
                    })
                }
                .navigationTitle("SwiftUI Alerts")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
