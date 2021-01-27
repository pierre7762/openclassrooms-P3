//
//  Fight.swift
//  P3
//
//  Created by Pierre Lemère on 13/01/2021.
//

import Foundation

class Game: ToolsGame {
    //MARK: Game
    static func game() {
        let tool = ToolsGame()
        var roundNumber = 0
        var listName =  ToolsGame().listPlayerName
        

        //MARK: Prepare game
        print("\(Text.getText(key: "start"))")
        
        let listTeam = tool.prepareGame(listName: &listName)
        let team1 = listTeam[0]
        let team2 = listTeam[1]
        
      
        //MARK: Game
        while tool.knowIfStillFightersAlive(team: team1) == true && tool.knowIfStillFightersAlive(team: team2) == true {
            roundNumber += 1
            // team one start
            print("<<<<<<<<<<<<<< ROUND \(roundNumber) : >>>>>>>>>>>>>>>>\n")
            if tool.knowIfStillFightersAlive(team: team1) == true  {
                tool.startRound(attacker: team1, defender: team2)
            }
            if tool.knowIfStillFightersAlive(team: team2) == true  {
                tool.startRound(attacker: team2, defender: team1)
            }
        }
 
        // end of game
        if tool.knowIfStillFightersAlive(team: team1) == true && tool.knowIfStillFightersAlive(team: team2) == false {
            print("///////////////////////////////////////////////////")
            print("     \(team2.teamName) WIN in \(roundNumber) Rounds ! ")
            print("///////////////////////////////////////////////////")
        }
        if tool.knowIfStillFightersAlive(team: team2) == true && tool.knowIfStillFightersAlive(team: team1) == false {
            print("///////////////////////////////////////////////////")
            print("     \(team1.teamName) WIN in \(roundNumber) Rounds ! ")
            print("///////////////////////////////////////////////////")
        }
        
//        detail
        team1.printFinalDetailsFighters()
        team2.printFinalDetailsFighters()
    }
    
    
}
