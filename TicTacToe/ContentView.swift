//
//  ContentView.swift
//  TicTacToe
//
//  Created by Sachin Panigrahi on 28/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 5) {
            ForEach(0...2, id: \.self) { row in
                HStack() {
                    ForEach(0...2, id: \.self) { col in
                        Text("")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white)
                    }
                }
            }
        }
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
