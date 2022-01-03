/*
 
 
 */

import SwiftUI

struct PointsView: View {
  
  @Binding var alertVisible: Bool
  @Binding var sliderValue: Double
  @Binding var logic: GameLogic
  
  var body: some View {
    
    let roundedValue = Int( sliderValue.rounded() )
    let points = logic.points(sliderValue: roundedValue)
    
    VStack(spacing: 10) {
      InstructionText(text: "value: ")
      BigNumberText(text: String(roundedValue))
      BodyText( text: "\(points) points\n🎉🎉🎉")
      Button( action: {
        withAnimation {
          alertVisible = false
        }
        logic.startNewRound(points: points)
      } ) {
        ButtonText( text: "new round")
      }
      
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow( radius: 10, x: 5, y: 6 )
    .transition(.scale)
  }
}

struct PointsView_Previews: PreviewProvider {
  
  static private var alertVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var logic = Binding.constant(GameLogic())
  
  static var previews: some View {
    PointsView(alertVisible: alertVisible, sliderValue: sliderValue, logic: logic)
    }
}
