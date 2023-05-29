//
//  ContentView.swift
//  TicTacToe
//
//  Created by Sachin Panigrahi on 28/05/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = GameViewModel()

    var body: some View {
        VStack(spacing: 5) {
            ForEach(0...2, id: \.self) { row in
                HStack() {
                    ForEach(0...2, id: \.self) { col in
                        Text(viewModel.getCell(for: row, _col: col))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                viewModel.setCell(state: viewModel.turn, row: row, col: col)
                            }
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
