//
//  RoundViews.swift
//  Bullseye
//
//  Created by Victor Sanchez on 12/13/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image( systemName: systemName )
      .font(.title)                         // bigger arrow
      .frame(width: Constants.General.roundedViewLength,
             height: Constants.General.roundedViewLength)
      .foregroundColor(.black)
      .overlay(
        Circle()
          .strokeBorder(Color.black, lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundRectTextView: View {            // text inside rounded rectangle
  var text: String
  
  var body: some View {
    Text( text )
      .kerning(0.2)
      .bold()
      .font(.title3)
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .foregroundColor(.black)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(.black)
      )
  }
}

struct RoundedTextView: View {
  
  let text: String
  
  var body: some View {
    Text(text)
      .font(.title)                         // bigger arrow
      .frame(width: Constants.General.roundedViewLength,
             height: Constants.General.roundedViewLength)
      .foregroundColor(.black)
      .overlay(
        Circle()
          .strokeBorder(Color( "LeaderboardRowColor" ), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack( spacing:10  ) {
      RoundedImageViewStroked( systemName: "arrow.counterclockwise")
      RoundedImageViewStroked( systemName: "list.dash")
      RoundRectTextView(text: "100")
      RoundedTextView(text: "1")
    }
  }
}

struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    //PreviewView()
    PreviewView()
  }
}
