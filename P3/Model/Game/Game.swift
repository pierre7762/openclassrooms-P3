//
//  Fight.swift
//  P3
//
//  Created by Pierre Lemère on 13/01/2021.
//

import Foundation


class Game: ToolsGame{
    
    //MARK: Game
    
    static func fightStart(){
        
        let tool = ToolsGame()
        var roundNumber = 0
        var listName =  ToolsGame().listPlayerName
        var team1: Team
        var team2: Team

        //MARK: Prepare game
        print("\(Text.getText(key: "start"))")

        //team one
        print(Text.getText(key: "createTeam1"))
        let listTeam1 = createControlledFighterList(listName: listName)
        for f in listTeam1 {
            listName.append(f.name)
        }
        
        team1 = Team.createTeam(listFightersTeam: listTeam1)

        //team two
        print(Text.getText(key: "createTeam2"))
        let listTeam2 = createControlledFighterList(listName: listName)
        for f in listTeam1 {
            listName.append(f.name)
        }
        
        team2 = Team.createTeam(listFightersTeam: listTeam2)
      

        //MARK: Game duration
        while team1.fighterInLife > 0 && team2.fighterInLife > 0 {
            roundNumber += 1
            // team one start
            print("<<<<<<<<<<<<<< ROUND \(roundNumber) : >>>>>>>>>>>>>>>>\n")
            if team1.fighterInLife > 0 {
                tool.round(attacker: team1, defender: team2)
            }
            if team2.fighterInLife > 0 {
                tool.round(attacker: team2, defender: team1)
            }
        }
 
        // end of game
        if team1.fighterInLife == 0 && team2.fighterInLife > 0{
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
        team1.finalDetail()
        team2.finalDetail()
        
    }
    
    
    static func createControlledFighterList(listName: [String]) -> [Fighter] {
        
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
