struct RockPaperScissorsGame {
    private(set) var gameResult: GameResult? = nil
    
    mutating func startRPSGame() {
        printRPSMenu()
        
        guard let userRPSNumber = fetchUserNumber() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return startRPSGame()
        }
        
        if userRPSNumber == 0 {
            print("게임 종료")
            return
        }
        
        let computerRPSNumber = Int.random(in: 1...3)
        
        guard let userRPS = HandShape.convertHandShape(from: userRPSNumber, type: .rps),
              let computerRPS = HandShape.convertHandShape(from: computerRPSNumber, type: .rps) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return startRPSGame()
        }
        
        let gameRPSResult = GameResult.judgeUserGameResultIn(userRPS, computerRPS)
        
        gameResult = gameRPSResult
        printResult(of: gameRPSResult)
        
        switch gameRPSResult {
        case .draw:
            startRPSGame()
        default:
            return
        }
    }
    
    private func printRPSMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    private func fetchUserNumber() -> Int? {
        guard let userInput = readLine() else {
            return nil
        }
        
        return Int(userInput)
    }
    
    private func printResult(of result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
    
    func fetchRPSGameResult() -> GameResult? {
        return self.gameResult
    }
}
