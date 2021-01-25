//
//  Fight.swift
//  P3
//
//  Created by Pierre Lemère on 13/01/2021.
//

import Foundation

class Game: ToolsGame {
    //MARK: Game
    static func startGame() {
        let tool = ToolsGame()
        var roundNumber = 0
//        var listName =  ToolsGame().listPlayerName
        var team1: Team
        var team2: Team

        //MARK: Prepare game
        print("\(Text.getText(key: "start"))")

        team one
        print(Text.getText(key: "createTeam1"))
        let listTeam1 = updateFighterListNameControlled(listName: listName)
        for f in listTeam1 {
            listName.append(f.name)
        }
        team1 = Team.createTeam(listFightersTeam: listTeam1, team1Name: nil)

        //team two
        print(Text.getText(key: "createTeam2"))
        let listTeam2 = updateFighterListNameControlled(listName: listName)
        for f in listTeam1 {
            listName.append(f.name)
        }
        team2 = Team.createTeam(listFightersTeam: listTeam2, team1Name: team1.teamName)
        
        //MARK:--------------------------------- Pour le test-------------------------------------------
//        let list1 = [
//            TheBoxer(name: "a"),
//            TheBully(name: "z"),
//            TheThinBlade(name: "e")
//        ]
//        let list2 = [
//            TheBoxer(name: "q"),
//            TheBully(name: "s"),
//            TheThinBlade(name: "d")
//        ]
//        team1 = Team.init(teamName: "team1", fightersList: list1)
//        team2 = Team.init(teamName: "team2", fightersList: list2)
        //MARK:--------------------------------- Pour le test-------------------------------------------
      
        //MARK: Game duration
        while team1.fighterInLife > 0 && team2.fighterInLife > 0 {
            roundNumber += 1
            // team one start
            print("<<<<<<<<<<<<<< ROUND \(roundNumber) : >>>>>>>>>>>>>>>>\n")
            if team1.fighterInLife > 0 {
                tool.startRound(attacker: team1, defender: team2)
            }
            if team2.fighterInLife > 0 {
                tool.startRound(attacker: team2, defender: team1)
            }
        }
 
        // end of game
        if team1.fighterInLife == 0 && team2.fighterInLife > 0 {
            print("///////////////////////////////////////////////////")
            print("     \(team2.teamName) WIN in \(roundNumber) Rounds ! ")
            print("///////////////////////////////////////////////////")
        }
        if team2.fighterInLife == 0 && team1.fighterInLife > 0 {
            print("///////////////////////////////////////////////////")
            print("     \(team1.teamName) WIN in \(roundNumber) Rounds ! ")
            print("///////////////////////////////////////////////////")
        }
        
//        detail
        team1.printFinalDetailsFighters()
        team2.printFinalDetailsFighters()
    }
    
    static func updateFighterListNameControlled(listName: [String]) -> [Fighter] {
        // we check if the name that the user wants to give it is not already assigned
        var listName = listName
        var listFightersTeam: [Fighter] = []
        
        for _ in 1 ..< 4 {
            let fighter = Fighter.createFighterChoice(listName: listName)
            listName.append(fighter.name)
            print(listName)
 
            listFightersTeam.append(fighter)
        }
        
        return listFightersTeam
    }
}
