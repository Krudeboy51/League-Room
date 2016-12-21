//
//  ViewController.swift
//  League Room
//
//  Created by Krudeboy51 on 12/16/16.
//  Copyright © 2016 KingEnterprise. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var champion = ChampionCollection()
    var mContext : NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        champion.loadAllChampions(){
            (list) in
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

