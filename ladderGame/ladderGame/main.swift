import Foundation

let numberOfPlayer = Int(readLine()!)!
if numberOfPlayer<2 || numberOfPlayer>8 {
    exit(0)
}

let ladderHeight = 4
var previousValue = -1
func printLadder (player : Int , height : Int){
    let horizontalLine = player - 1
    var verticalLineArray : [[Int]] = [[],[],[],[]]
    var randomNumberArray : [Int] = []
    while(true){
        randomNumberArray.append(Int.random(in: 0..<horizontalLine*4))
        
        if previousValue == randomNumberArray.last! {
            randomNumberArray.removeLast()
        }
        else {
            previousValue = randomNumberArray.last!
        }
        
        if randomNumberArray.count == horizontalLine {
            break
        }
    }
    
    randomNumberArray=randomNumberArray.sorted(by: >)
//print(randomNumberArray.last!)
    //랜덤으로 숫자 생성 완료
    
    for i in 0..<height {
        for j in 0..<player*2-1 {
            if j % 2 == 0{
                verticalLineArray[i].append(1)
            }
            else if j % 2 != 0 {
                if randomNumberArray.count > 0{
                    if (player+horizontalLine) * i + j == (randomNumberArray.last!)*2 + i+1 {
                        verticalLineArray[i].append(1)
                        randomNumberArray.popLast()
                    }
                    else{
                        verticalLineArray[i].append(0)
                        }
                }
                else {
                    verticalLineArray[i].append(0)
                }
            }
        }
    }
// 뽑힌 숫자에 맞는 자리에 1 넣어.
// 1이면 '-' 0이면 ' '
    for i in 0..<height {
        for j in 0..<(player+horizontalLine){
            if j%2 == 0 {
                print("|",terminator: "")
            }
            else if j%2 != 0 {
                if verticalLineArray[i][j] == 1 {
                    print("-",terminator: "")
                }
                else if verticalLineArray[i][j] == 0 {
                    print(" ",terminator: "")
                }
            }
        }
        print("")
    }
}
    


//홀수 0 ~ player*2 -1  범위에서 horizontalLine 개  랜덤으로 뽑아서 1넣어.

printLadder(player: numberOfPlayer, height: ladderHeight)

