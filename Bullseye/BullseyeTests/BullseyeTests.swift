
// to run: Product -> Test


import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
  
  var game: GameLogic!                                      // optional variable, may or may not be initialized

    override func setUpWithError() throws {                 // Setup code. Gets everything ready to run the other tests
      game = GameLogic()                                    // creates instance of a game to run tests on
      
    }

    override func tearDownWithError() throws {              // Teardown code. Does everything it needs to do after tests are complete
        
      game = nil
    }
  
  /*func testScorePositive() {                              // My own tests after setup and teardown functions
    var guess  = game.target + 5                            // function should return value in 2nd parameter
    var score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    var guess  = game.target + 5
    var score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }*/
  
  func testNewRound() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)
  }
  
  func testScoreExact() {                                   // points for exact score
    let guess = game.target
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 100 + 100)                        // 100 bonus points
  }
  
  func testScoreClose() {                                   // points for close score
    let guess = game.target + 2
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 98 + 50)                          // 50 bonus points
  }
  
  func testRestart() {                                      // making sure values arent initial values after restart
    game.startNewRound(points: 100)
    XCTAssertNotEqual(game.score, 0)
    XCTAssertNotEqual(game.round, 1)
    game.restart()
    XCTAssertEqual(game.score, 0)
    XCTAssertEqual(game.round, 1)
  }
  
  func testLeaderboard() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.leaderboardEntries.count, 1)
    XCTAssertEqual(game.leaderboardEntries[0].score, 100)
    game.startNewRound(points: 200)
    XCTAssertEqual(game.leaderboardEntries.count, 2)
    XCTAssertEqual(game.leaderboardEntries[0].score, 200)
    XCTAssertEqual(game.leaderboardEntries[1].score, 100)
  }
  
}
