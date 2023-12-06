import SwiftUI

struct feeView: View {
    @State private var buildingCost: String = "1000000"
    @State private var difficultyDegree: String = "1"
    @State private var deliverableProportion: String = "100"
    @State private var adjustmentFactor: String = "1"
    @State private var hourlyRate: String = "130"
    
    @FocusState var isFocused: Bool // für Ausblenden des Keyboards
    
    private var totalHours: Double {
        let B = Double(buildingCost) ?? 0
        let p = Double(basicFactor) ?? 0
        let n = Double(difficultyDegree) ?? 0
        let q = Double(deliverableProportion) ?? 0
        let r = Double(adjustmentFactor) ?? 0
        
        return B * (p / 100) * n * (q / 100) * r
    }
    
    private var Z1: String {
        if selectedOption == 1 {
            return "0.062"
        } else if selectedOption == 2 {
            return "0.062"
        } else if selectedOption == 3 {
            return "0.062"
        } else {
            return ""
        }
    }
    
    
    private var Z2: String {
        if selectedOption == 1 {
            return "10.58"
        } else if selectedOption == 2 {
            return "10.58"
        } else if selectedOption == 3 {
            return "10.58"
        } else {
            return ""
        }
    }
    
    private var basicFactor: String {
        
        let Z1temp: Double = Double(Z1) ?? 0
        let Z2temp: Double = Double(Z2) ?? 0
        let buildingCostTemp: Double = Double(buildingCost) ?? 0
        let cubicRootTemp: Double = pow(buildingCostTemp, 1/3)
        let basicFactorTemp: Double = Z1temp + (Z2temp/cubicRootTemp)
        
        return String(basicFactorTemp)
    }
    
   private var totalFee: Double { //geteilt mit feePercentageView
        
        let totalHoursTemp: Double = totalHours
        let hourlyRateTemp: Double = Double(hourlyRate) ?? 0
        let totalFeeTemp: Double = totalHoursTemp * hourlyRateTemp
        
        return totalFeeTemp
    }
    
    @State var selectedOption = 1 //picker selected option
    
    var body: some View {
        
        ScrollView{
            
            VStack{
                Image("honorar")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
            }
            .frame(maxWidth: .infinity)
            
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text("Honorarberechnung")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text("Dieses Werkzeug dient der Berechnung des Architektenhonorars. Es kalkuliert den voraussichtlich benötigten Zeitaufwand anhand der aufwandbestimmenden Baukosten und kalkuliert das daraus resultierende Honorar.")
                    
                }
                
                dashSpaceDiv()
                
                Group{
                    
                    Text("Basisfaktor p")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: groupSpacer)
                    
                    Text("Faktoren Z1 und Z2")
                        .fontWeight(.bold)
                    
                    Text("statistische Faktoren")
                    
                    HStack{
                        Text("Jahr:")
                        Picker(selection: $selectedOption, label: Text("Picker")) {
                            Text("2016").tag(1)
                            Text("2017").tag(2)
                            Text("2018").tag(3)
                        }
                    }
                    
                    Text("Z1: " + Z1)
                        .padding(.bottom, 5.0)
                        .foregroundColor(Color("resultTextColor"))

                    Text("Z2: " + Z2)
                        .padding(.bottom, 5.0)
                        .foregroundColor(Color("resultTextColor"))

                    Spacer()
                        .frame(height: groupSpacer)
                }
                
                
                
                Group {
                    Text("Aufwandbestimmende Baukosten B (chf)")
                        .fontWeight(.bold)
                    
                    Text("Baukosten ohne Honorare, Nebenkosten, ect.")
                    
                    TextField("Building Cost", text: $buildingCost)
                        .focused($isFocused)
                        .keyboardType(.decimalPad)
                        .padding(5)
                        .background(Color("textField"))
                    // Button("OK"){
                    //     isFocused = false
                    //}
                    
                    Spacer()
                        .frame(height: groupSpacer)
                }
                
                Group {
                    Text("Basisfaktor p")
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    Text(basicFactor)
                        .foregroundColor(Color("resultTextColor"))

                    
                }
                
                dashSpaceDiv()
                
                Group {
                    
                    Text("Modifikatoren")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: groupSpacer)
                    
                    Text("Schwierigkeitsgrad n")
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    TextField("Schwierigkeitsgrad", text: $difficultyDegree)
                        .focused($isFocused)
                        .keyboardType(.decimalPad)
                        .padding(5)
                        .background(Color("textField"))
                    Spacer()
                        .frame(height: groupSpacer)
                }
                
                
                Group {
                    Text("Leistungsanteil q")
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    TextField("Leistungsanteil", text: $deliverableProportion)
                        .focused($isFocused)
                        .keyboardType(.decimalPad)
                        .padding(5)
                        .background(Color("textField"))
                    Spacer()
                        .frame(height: groupSpacer)
                    
                }
                
                
                Group {
                    
                    Text("Anpassungsfaktor q")
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    TextField("Anpassungsfaktor", text: $adjustmentFactor)
                        .focused($isFocused)
                        .keyboardType(.decimalPad)
                        .padding(5)
                        .background(Color("textField"))
                    Spacer()
                        .frame(height: groupSpacer)
                }
                
                
                Group {
                    
                    Text("Stundensatz h (chf/h)")
                        .fontWeight(.bold)
                        .padding(.vertical, 5.0)
                    
                    TextField("Stundensatz", text: $hourlyRate)
                        .focused($isFocused)
                        .keyboardType(.decimalPad)
                        .padding(5)
                        .background(Color("textField"))
                    
                }
                
                dashSpaceDiv()
                
                Text("Honorar")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(height: groupSpacer)
                
                GroupBox(){
                    VStack(alignment: .leading) {
                        
                        Text("Total Stunden (h)")
                            .fontWeight(.bold)
                            .font(.title2)
                        
                        HStack{
                            Text(formatNumber(totalHours))
                                .font(.title2)
                                .textSelection(.enabled)
                            
                            Button{
                                UIPasteboard.general.string = formatNumber(totalHours)
                            } label: {
                                Image(systemName: "doc.on.doc")
                                    .foregroundColor(Color("textColor"))
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .groupBoxStyle(subResultGroupBox())
                
                Spacer()
                    .frame(height: groupSpacer)
                
                GroupBox{
                    VStack(alignment: .leading) {
                        
                        Text("Total Honorar (chf)")
                            .fontWeight(.bold)
                            .font(.title2)
                        
                        HStack{
                            Text(formatNumber(totalFee))
                                .font(.title2)
                                .textSelection(.enabled)
                            
                            Button{
                                UIPasteboard.general.string = formatNumber(totalFee)
                            } label: {
                                Image(systemName: "doc.on.doc")
                                    .foregroundColor(Color("textColor"))
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .groupBoxStyle(resultGroupBox())
                
                NavigationLink(destination: feePercentageView()){
                    Text("view by phase")
                }
                
            }
            
            .padding(25)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }.onTapGesture {
            if (isFocused == true) {
                isFocused = false
            }
        }
    }
}

struct feeView_Previews: PreviewProvider {
    static var previews: some View {
        feeView()
    }
}
