

import SwiftUI

struct InstructionText: View {
  var text: String                            // takes parameter from ContentView
  
  var body: some View {
    Text(text)
      .kerning(2.0)                           // spacing between letters
      .font(.title3)
      .bold()
      .multilineTextAlignment(.center)        // justified center text
      .lineSpacing(10)                        // space between line in same text view
      .foregroundColor(.black)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(String(text))
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(.black)
  }
}

struct SliderTextLeft: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .frame(width: 40.0 )          // makes both 1 and 100 same width
      .foregroundColor(.black)
  }
}

struct SliderTextRight: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .frame(width: 35.0 )          // makes both 1 and 100 same width
      .foregroundColor(.black)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .kerning(1.5)
      .font(.caption)
      .foregroundColor(.black)
  }
}

struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
      .foregroundColor(.black)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .foregroundColor(.white)
      .cornerRadius(12.0)
  }
}

struct ScoreText: View {
  var score: Int
  
  var body: some View {
    Text( String( score ) )
      .bold()
      .kerning(-0.2)
      .foregroundColor(.black)
      .font(.title3)
  }
}

struct DateText: View {
  var date: Date
  
  var body: some View {
    Text( date, style: .time )
      .bold()
      .kerning(-0.2)
      .foregroundColor(.black)
      .font(.title3)
  }
}

struct BigBoldText: View {
  let text: String
  
  var body: some View {
    Text(text)
      .kerning(2.0)
      .foregroundColor(.black)
      .font(.title)
      .fontWeight(.black)
  }
}

struct TextVies_Previews: PreviewProvider {
  static var previews: some View {
    
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderTextLeft(text: "99")
      SliderTextRight(text: "99")
      LabelText( text: "9" )
      BodyText( text: "100 points\n🎉🎉🎉")
      ButtonText( text: "new round")
      ScoreText(score:  459)
      DateText(date: Date())
      BigBoldText(text: "leaderboard")
    }
    .padding()
  }
}
