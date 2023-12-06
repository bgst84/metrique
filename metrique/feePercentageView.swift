//
//  feePercentageView.swift
//  metrique
//
//  Created by Yves Seiler on 06.10.2023.
//

import SwiftUI

struct feePercentageView: View {
    
    
    var body: some View {
        
        ScrollView{
            
            Grid(alignment: .center, verticalSpacing: 10){
                
                Spacer()
                    .frame(height:groupSpacer)
                
                GridRow(){
                    Text("Honorarphase")
                        .gridColumnAlignment(.leading)
                    Text("Beschrieb")
                        .gridColumnAlignment(.leading)
                    Text("Prozent")
                        .gridColumnAlignment(.trailing)
                    Text("Stunden")
                        .gridColumnAlignment(.trailing)
                    Text("chf/h")
                        .gridColumnAlignment(.trailing)
                    Text("Honorar")
                        .gridColumnAlignment(.trailing)
                }
                
                dashDivider()
                
                GridRow(){ //VORPROJEKT
                    Text("Vorprojekt")
                    Text("Vorprojekt und Kostenschätzung")
                        .lineLimit(nil)  // Remove line limit
                        .fixedSize(horizontal: false, vertical: true)  // Allow vertical resizing
                    Text("9%")
                    Text("Stunden")
                    Text("130")
                    Text("20000")
                    
                }
                
            }
            
        }
    }
}

#Preview {
    feePercentageView()
}
