//
//  ContentView.swift
//  RoyalTitheLedger
//
//  Created by Jerry Toland on 4/28/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var titheList: [Float] = []
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Image(systemName: "crown.fill")
                    Text("Royal Tithe Ledger")
                    
                    ForEach($titheList, id: \.self) { $tithe in
                        Text(tithe, format: .currency(code: "USD"))
                            .foregroundStyle(Color.gray)
                    }
                }
                .font(.largeTitle)
                .foregroundStyle(.tint)
                .frame(maxWidth: .infinity, alignment: .center)
                
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Text("Add Tithe")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 6)
                .font(.title)
                .background(.tint)
                .foregroundStyle(.white)
                .cornerRadius(10)
                .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss) {
                    
                    TitheEntryView(tithes: $titheList)
                    
                }
            }
        }
        .padding()
        .background(.tint)
    }
    
    func didDismiss() {
        print()
    }
}

#Preview {
    ContentView()
}
