//
//  Text.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

class Text {
    var contained: String
    
    init(contained: String) {
        self.contained = contained
    }
    
    //To use this function in main.swift Text.getText()["The key to the desired text "]!
    static func getText() -> [String: String]{
        return [
            //"Key" : "Value"
            "start": "Hello, start game ! \n",
            "createTeam1": "Create the personnal team of player One : \n",
            "createTeam2": "Create the personnal team of player Two: \n",
            "teamName": "What is the name of your team?",
            "createFighter": "Let's create a fighter :",
            "fighterType": "What type of fighter do you want? \n -For a boxer type 1 \n -For a thin blade type 2 \n -For a bully type 3",
            "fighterName": "What is the name of this fighter ?"
        
        ]
    }

}


