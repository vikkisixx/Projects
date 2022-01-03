
// func methodName( parameterName: ParameterType) -> return type {
//  code goes here
//  return returnValue
// }

// variables can have their value changed at any time
// let keyword creates constant values

import Foundation

struct LeaderboardEntry {
  var score: Int
  var date: Date
}

struct GameLogic {
  
  var target = Int.random( in: 1...100 )          // specifying data type unecessary when initial value is Int
  var score = 0                                   // initial values
  var round = 1                                   // will have to reset values in subsequent new rounds
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
    }
  }
  
  func points( sliderValue: Int ) -> Int {
    
    let difference = abs( sliderValue - target )
    var bonus = 0
    if ( difference == 0 ) {
      bonus = 100
    }
    else if ( difference <= 2 ) {
      bonus = 50
    }
    return 100 - difference + bonus               // 100 - ( difference between slider guess and bullseye value )
  }
  
  mutating func addToLeaderboard(point: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
    leaderboardEntries.sort{ $0.score > $1.score }
  }
  
  mutating func startNewRound(points: Int) {      // mutating indicates that the values inside will change
    score += points                               // points for each round count towards the game
    round += 1
    target = Int.random( in: 1...100 )
    addToLeaderboard(point: points)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random( in: 1...100 )
  }
}
