//
//  CreateTeam.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

class Team {
    var teamName: String
    var fightersList: [Fighter]
    var fighterInLife = 3
    
    //choice the team name and your fighters types. Warning : don't forget to give name for all fighters
    init(teamName: String, fightersList: [Fighter]) {
        self.teamName = teamName
        self.fightersList = fightersList
        
    }
    
    static func createTeam(listFightersTeam: [Fighter], team1Name: String?) -> Team {
        var teamOneName: String
        if team1Name == nil {
            teamOneName = "."
        } else {
            teamOneName = team1Name ?? "."
        }
       
        //choice the team name
        print(Text.getText(key: "teamName"))
        var teamName = readLine()!
        var isOk = false
        var containsAtLeastOneLettreLowercase = false
        
        if teamOneName.elementsEqual(".") {
            //while the user don't write a word the question loop
            while isOk == false {
                if teamName.elementsEqual("") {
                    print(Text.getText(key: "teamName"))
                    teamName = readLine()!
                } else {
                    let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
                    //name with at least one lowercase letter ?
                    containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: teamName)
                    if containsAtLeastOneLettreLowercase == false {
                        print(Text.getText(key: "leastOneLowercase"))
                        teamName = readLine()!
                    } else {
                        isOk = true
                    }
                    
                   if teamName.elementsEqual(teamOneName) {
                        while teamName.elementsEqual(teamOneName) {
                            print(Text.getText(key: "existingName"))
                            teamName = readLine()!
                            isOk = false
                        }
                   } else {
                    let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
                    //name with at least one lowercase letter ?
                    containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: teamName)
                    if containsAtLeastOneLettreLowercase == false {
                        print(Text.getText(key: "leastOneLowercase"))
                        teamName = readLine()!
                    } else {
                        isOk = true
                    }
                   }
                }
            }
        } else {
            if teamName.elementsEqual(teamOneName) {
                //while the user don't write a word the question loop
                while isOk == false {
                    if teamName.elementsEqual("") {
                        print(Text.getText(key: "teamName"))
                        teamName = readLine()!
                    } else {
                        let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
                        //name with at least one lowercase letter ?
                        containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: teamName)
                        if containsAtLeastOneLettreLowercase == false {
                            print(Text.getText(key: "leastOneLowercase"))
                            teamName = readLine()!
                        } else {
                            isOk = true
                        }
                        
                       if teamName.elementsEqual(teamOneName) {
                            while teamName.elementsEqual(teamOneName) {
                                print(Text.getText(key: "existingName"))
                                teamName = readLine()!
                                isOk = false
                            }
                       } else {
                        let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
                        //name with at least one lowercase letter ?
                        containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: teamName)
                        if containsAtLeastOneLettreLowercase == false {
                            print(Text.getText(key: "leastOneLowercase"))
                            teamName = readLine()!
                        } else {
                            isOk = true
                        }
                       }
                    }
                }
            } else {
                //while the user don't write a word the question loop
                while isOk == false {
                    if teamName.elementsEqual("") {
                        print(Text.getText(key: "teamName"))
                        teamName = readLine()!
                    } else {
                        let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
                        //name with at least one lowercase letter ?
                        containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: teamName)
                        if containsAtLeastOneLettreLowercase == false {
                            print(Text.getText(key: "leastOneLowercase"))
                            teamName = readLine()!
                        } else {
                            isOk = true
                        }
                        
                        if teamName.lowercased().elementsEqual(teamOneName.lowercased()) {
                            while teamName.lowercased().elementsEqual(teamOneName.lowercased()) {
                                print(Text.getText(key: "existingName"))
                                teamName = readLine()!
                                isOk = false
                            }
                       } else {
                        let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
                        //name with at least one lowercase letter ?
                        containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: teamName)
                        if containsAtLeastOneLettreLowercase == false {
                            print(Text.getText(key: "leastOneLowercase"))
                            teamName = readLine()!
                        } else {
                            isOk = true
                        }
                       }
                    }
                }
            }
        }
        
        let team = Team(teamName: teamName, fightersList: listFightersTeam )
        
        return team
    }
    
    func printFinalDetailsFighters() {
        for i in 0 ..< self.fightersList.count {
            var lifeOrDead = ""
            if self.fightersList[i].isDead == true {
                lifeOrDead = "Dead"
            } else {
                lifeOrDead = "Alive"
            }
            
            print("\(lifeOrDead) - \(self.fightersList[i].name) (\(self.fightersList[i].typeName)): \(self.fightersList[i].life)/\(self.fightersList[i].lifeMax) life points | weapon : \(self.fightersList[i].weaponPower) | max damage : \(self.fightersList[i].getMaxAttackPotentiel()) pts | critical hit % : \(self.fightersList[i].criticalHitPercentage) %")
        }
    }
    
}

