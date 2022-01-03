
// instance
//  methodName(parameter)

// functionName(parameter)    not attached to an instance, like print("idk")

// state: program's numerical or boolean values
// when state changes, recompute body
// binding: a view is tied to a state value

// this is a View Class, because it handles the look of the app

// self keyword like java's this keyword

import SwiftUI

struct ContentView: View {                            // view contains other views
  
  @State private var alertVisible = false
  @State private var sliderValue = 50.0               // color from Assets
  @State private var logic = GameLogic()              // refresh for changing data
  
  var body: some View {                               // body view contains text
    ZStack {
      BackgroundView(logic: $logic)                    // game, what its called in bgview
      VStack {
        InstructionsView(logic: $logic)               // give other struct access to logic
          .padding(.bottom, alertVisible ? 0 : 100 )  // adds space below it
        if alertVisible {
          PointsView(alertVisible: $alertVisible,
                     sliderValue: $sliderValue,
                     logic: $logic)
            .transition(.scale)
        } else {
          HitButton( alertVisible: $alertVisible,
                     sliderValue: $sliderValue,
                     logic: $logic )
            .transition(.scale)
        }
      }
      if !alertVisible {
        SliderView(sliderValue: $sliderValue)         // give other struct slidervalue access
          .transition(.scale)
      }
    }
  }
}

struct InstructionsView: View {
  
  @Binding var logic: GameLogic
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯hit the bullseye 🎯")
      BigNumberText(text: String(logic.target))
    }
  }
}

struct SliderView: View {
  
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderTextLeft(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0) // circle starting point, slider range
      SliderTextRight(text: "100")
    }
    .padding()
  }
}

struct HitButton: View {
  @Binding var alertVisible: Bool
  @Binding var sliderValue: Double
  @Binding var logic: GameLogic
  
  var body: some View {
    Button(action: {                               // Button(action: {whatever}) { look }
      withAnimation {
        alertVisible = true                        // self refers to something in this view
      }
    }) {
      Text("hit")
        .bold()
        .font(.title3)
    }
    .padding(20.0)
    .background(ZStack {
      Color.red
      LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                                        startPoint: .top, endPoint: .bottom)  // button color gradient
    })
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundRectCornerRadius)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    //ContentView()
      //.previewInterfaceOrientation(.landscapeLeft)
  }
}
