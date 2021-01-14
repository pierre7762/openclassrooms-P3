//
//  CreateTeam.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

class Team{
    var teamName: String
    var fighterOne: Fighter
    var fighterTwo: Fighter
    var fighterTree: Fighter
    var fighterInLife = 3
    
    //choice the team name and your fighters types. Warning : don't forget to give name for all fighters
    init(teamName: String, typeFighterOne: Fighter, typeFighterTwo: Fighter, typeFighterTree: Fighter) {
        self.teamName = teamName
        self.fighterOne = typeFighterOne
        self.fighterTwo = typeFighterTwo
        self.fighterTree = typeFighterTree
    }
    
    static func createTeam(fighterOne: Fighter, fighterTwo: Fighter, fighterTree: Fighter) -> Team{
        //choice the team name
        print(Text.getText()["teamName"]!)
        var teamName = readLine()!
        if teamName == ""{
            //while the user don't write a word the question loop
            while teamName == "" {
                print(Text.getText()["teamName"]!)
                teamName = readLine()!
            }
        }
   
        let team = Team(teamName: teamName, typeFighterOne: fighterOne, typeFighterTwo: fighterTwo, typeFighterTree: fighterTree)
        
        return team
        
    }
    
    
    
}
