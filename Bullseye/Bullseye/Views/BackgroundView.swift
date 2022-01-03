/*
 for loop example that prints mutliples of 10 up to 100
 
 ForEach( 1..<11 ) variableName in {
  let otherVariable = variableName * 10
  print otherVariable
 }
 
*/

import SwiftUI

struct BackgroundView: View {
  @Binding var logic: GameLogic
  
  var body: some View {
    VStack {
      TopView(logic: $logic)
      Spacer()
      BottomView(logic: $logic)
    }
    .padding()
    .background( RingsView() )
  }
}

struct TopView: View {            // elements on the top of the screen
  @Binding var logic: GameLogic
  @State private var leaderboardShowing = false                                                 // leaderboardShowing source
  
  var body: some View {
    HStack {
      Button(action: {
        logic.restart()
      }) {
        RoundedImageViewStroked( systemName: "arrow.counterclockwise")
      }
      Spacer()                                                                                  // uses all space available, fills space between
      Button( action:  { leaderboardShowing = true } ) {                                        // shows leaderboard
        RoundedImageViewStroked( systemName: "list.dash")                                       // using this as a button
      }
      .sheet(isPresented: $leaderboardShowing,
             onDismiss: {},
             content: { LeaderboardView(leaderboardShowing: $leaderboardShowing, logic: $logic) }
      )  // shows this
    }
  }
}

struct NumberView: View {
  
  var title: String
  var text: String
  
  var body: some View {
    VStack(spacing: 5) {
      LabelText(text: title)          // just used these for the format
      RoundRectTextView(text: text)   // but info sent from BottomView
    }
  }
}

struct BottomView: View {             // elements on the top of the screen
  @Binding var logic: GameLogic
  
  var body: some View {
    HStack {
      NumberView( title: "Score", text: String(logic.score) )
      Spacer()                    // uses all space available, fills in space between
      NumberView( title: "Round", text: String(logic.round) )
    }
  }
}

struct RingsView: View {
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      ForEach( 1..<6 ) { ring in
        let size = CGFloat( ring * 100 )
        Circle()
          .stroke( lineWidth: 20.0 )
          .fill(
            RadialGradient( gradient: Gradient(colors:
                                                [ Color( "RingsColor" )
                                                    .opacity( 0.3 * 0.4 ),
                                                  Color( "RingsColor" )
                                                    .opacity( 0 ) ] ),
                            center: .center, startRadius: 100, endRadius: 300)
          )
          .frame( width: size, height: size )
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView( logic: .constant( GameLogic() ) )
  }
}
