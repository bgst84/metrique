//
//  baseFunctions.swift
//  honorarrechner
//
//  Created by Yves Seiler on 18.06.23.
//

import Foundation
import SwiftUI

func formatNumber(_ number: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 1 // Number of decimal places
    numberFormatter.groupingSeparator = "'" // Separator for thousands
    
    return numberFormatter.string(from: NSNumber(value: number)) ?? "0"
}

func formatNumber2(_ number: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 2 // Number of decimal places
    numberFormatter.groupingSeparator = "'" // Separator for thousands
    
    return numberFormatter.string(from: NSNumber(value: number)) ?? "0"
}



func dashDivider() -> some View{
    return Image("dash")
        .resizable(capInsets: EdgeInsets(), resizingMode:.tile)
        .frame(width:.infinity, height:1)
        .padding(0)
}

struct dashSpaceDiv: View {
    var body: some View {
        
        Spacer()
            .frame(height: 30)
        
        Image("dash")
            .resizable(capInsets: EdgeInsets(), resizingMode:.tile)
            .frame(width:.infinity, height:1)
        
        Spacer()
            .frame(height: 30)
        
    }
}

extension UIApplication {
    static var release: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String? ?? "x.x"
    }
    static var build: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String? ?? "x"
    }
    static var version: String {
        return "\(release).\(build)"
    }
}

