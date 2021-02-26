//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumbers: [Int] = []
var playerNumbers: [Int] = []

var remainingNumber: Int = 9

//enum BallCount: Int{
//    case strike
//    case ball
//}

func makeRandomNumbers () -> [Int] {
    var returnValue: [Int] = []
    var randomNumber: Int
    
    repeat {
        randomNumber = Int.random(in: 1...9)
        if !returnValue.contains(randomNumber) {
            returnValue.append(randomNumber)
        }
    } while returnValue.count < 3
    
    return returnValue
}

func calculateStrikesAndBalls(targetNumbers: [Int], compareNumbers: [Int]) -> (Int, Int) {
    var ballCount = (strike: 0, ball: 0)
    
    for (index, element) in compareNumbers.enumerated() {
        if targetNumbers.contains(element) {
            if targetNumbers[index] == compareNumbers[index] {
                ballCount.strike += 1
            }
            else {
                ballCount.ball += 1
            }
        }
    }
    
    return ballCount
}

func startGame() {
    computerNumbers = makeRandomNumbers()
    
    repeat {
        playerNumbers = makeRandomNumbers()
        print("임의의 수 :", playerNumbers)
        
        let result: (strike: Int, ball: Int) = calculateStrikesAndBalls(targetNumbers: computerNumbers, compareNumbers: playerNumbers)
        print(result.strike, "스트라이크,", result.ball, "볼")
        
        remainingNumber -= 1
        print("남은 기회 :", remainingNumber)
    } while remainingNumber > 0
}

//startGame()

func printGameMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator:"")
}

func getMenuInput() -> String {
    guard let input = readLine() else {
        print("입력이 잘못되었습니다")
        return ""
    }
    return input
}

func executeMenu(menuInput: String) {
    switch menuInput {
    case "1":
        startGame()
    case "2":
        exit(0)
    default:
        print("입력이 잘못되었습니다")
    }
        
}

func showMenu() {
    
    while true {
        printGameMenu()
        executeMenu(menuInput: getMenuInput())
    }
}

showMenu()


