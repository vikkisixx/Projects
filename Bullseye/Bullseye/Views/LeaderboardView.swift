//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Victor Sanchez on 12/29/21.
//

import SwiftUI

struct LeaderboardView: View {
  
  @Binding var leaderboardShowing: Bool
  @Binding var logic: GameLogic
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack (spacing: 10){
        HeaderView(leaderboardShowing: $leaderboardShowing)         // leaderboard  x
        LabelView()                                               // score        date
        ScrollView {                                              // scrollable in landscape
          VStack (spacing: 10) {
            ForEach(logic.leaderboardEntries.indices) { i in      // loop thru indices
              let leaderboardEntry = logic.leaderboardEntries[ i ]
              RowView(index: i,                                   // 1      10    12:14pm
                      score: leaderboardEntry.score,
                      date: leaderboardEntry.date )
            }
          }
        }
      }
    }
  }
}

struct RowView: View {
  
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack{
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)    // adds space from the left
    .padding(.trailing)   // adds space from the right
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct HeaderView: View {
  
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Binding var leaderboardShowing: Bool
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          BigBoldText(text: "leaderboard")
            .frame(maxWidth: .infinity, alignment: .center)
          Spacer()
        } else {
          BigBoldText(text: "leaderboard")
        }
      }
      .padding(.top)
      HStack {
        Spacer()
        Button( action: {
          leaderboardShowing = false                            // x button dismissed leaderboard popup
        } ) {
          RoundedImageViewStroked(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "score")
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      LabelText(text: "date")
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.leading)    // adds space from the left
    .padding(.trailing)   // adds space from the right
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  
  static private var leaderboardShowing = Binding.constant(false)
  static private var logic = Binding.constant(GameLogic(loadTestData: true))
  
  static var previews: some View {
    LeaderboardView(leaderboardShowing: leaderboardShowing, logic: logic)
  }
}
 
