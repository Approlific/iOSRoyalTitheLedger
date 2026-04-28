//
//  TitheEntryView.swift
//  RoyalTitheLedger
//
//  Created by Jerry Toland on 4/28/26.
//

import SwiftUI

struct TitheEntryView: View {
    
    @Binding var tithes: [Float]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let buttons = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "C", "0", "."]
    
    @State private var display: String = "0"
    
    var body: some View {
        VStack {
            
            Text(display)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.largeTitle)
                .foregroundStyle(.gray)
                .padding()
            
            LazyVGrid(columns: columns) {
                ForEach(buttons, id: \.self) { label in
                    Button {
                        if label == "C" {
                            display = "0"
                        } else if display == "0" && label != "." {
                            display = label
                        } else {
                            display += label
                        }
                    } label: {
                        Text(label)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.tint)
                            .foregroundStyle(.white)
                            .clipShape(Circle())
                    }
                }
            }
            
            Button {
                addTithe(tithes: tithes, display: display)
            } label: {
                Text("Add Tithe")
                    .font(.title)
                    .frame(alignment: .center)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(.tint)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .padding(.top, 16)
            }
        }
    }
    
    func addTithe(tithes: [Float], display: String) {
        self.tithes.append(Float(display) ?? 0)
        self.display = "0"
    }
}

#Preview {
    TitheEntryView(tithes: .constant([102.25, 11.23, 45.21]))
}
