//
//  controleName.swift
//  P3
//
//  Created by Pierre Lemère on 14/01/2021.
//

import Foundation

class NameControl {
    var listName: [String]
    
    init(names: [String]) {
        self.listName = names
    }
  
}

func IsItUnique(listName: [String],name: String) -> [String]{
    var newListName = listName
    for nameInList in listName {
        if name == nameInList {
            print("This name is already given, Please give another name !")
            return listName
        }
    }
    newListName.append(name)
    return newListName
}
