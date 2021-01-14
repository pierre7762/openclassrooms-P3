//
//  main.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

//MARK: var
var team1: Team
var fighterOneTeamOne: Fighter
var fighterTwoTeamOne: Fighter
var fighterTreeTeamOne: Fighter


var team2: Team
var fighterOneTeamTwo: Fighter
var fighterTwoTeamTwo: Fighter
var fighterTreeTeamTwo: Fighter


//MARK: Prepare game

print("\(Text.getText()["start"]!)")

//team one
print(Text.getText()["createTeam1"]!)

    //Create fighter 1
    print("Create fighter one: \n")
    fighterOneTeamOne = Fighter.createFighterChoice()

    //Create fighter 2
    print("Create fighter two: \n")
    fighterTwoTeamOne = Fighter.createFighterChoice()

    //Create fighter 3
    print("Create fighter tree: \n")
    fighterTreeTeamOne = Fighter.createFighterChoice()

team1 = Team.createTeam(fighterOne: fighterOneTeamOne, fighterTwo: fighterTwoTeamOne, fighterTree: fighterTreeTeamOne)

//team two
print(Text.getText()["createTeam2"]!)

    //Create fighter 1
    print("Create fighter one: \n")
    fighterOneTeamTwo = Fighter.createFighterChoice()

    //Create fighter 2
    print("Create fighter two: \n")
    fighterTwoTeamTwo = Fighter.createFighterChoice()

    //Create fighter 3
    print("Create fighter tree: \n")
    fighterTreeTeamTwo = Fighter.createFighterChoice()

team2 = Team.createTeam(fighterOne: fighterOneTeamTwo, fighterTwo: fighterTwoTeamTwo, fighterTree: fighterTreeTeamTwo)



////MARK: pour tester !!!!!!!
//team1 = Team.createTeam(fighterOne: TheBully(name: "brute1"), fighterTwo: TheBully(name: "brute2"), fighterTree: TheBully(name: "brute3"))
//team1.teamName = "The team ONE"
//team2 = Team.createTeam(fighterOne: TheBoxer(name: "boxer1"), fighterTwo: TheBoxer(name: "boxer2"), fighterTree: TheBoxer(name: "boxer3"))
//team2.teamName = "Second team"

//MARK: Game

Fight.game(team1: team1, team2: team2)
