//
//  ChampionListViewController.swift
//  League Room
//
//  Created by Krudeboy51 on 12/19/16.
//  Copyright © 2016 KingEnterprise. All rights reserved.
//

import UIKit
import CoreData;

class ChampionListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var mContext : NSManagedObjectContext!
    var championList = [Champion]()
    
    @IBOutlet weak var championListView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            print("mcontext set")
            mContext = appDelegate.persistentContainer.viewContext
        }
        fetchData();
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = championListView.dequeueReusableCell(withReuseIdentifier: "championCell", for: indexPath) as! ChampionCollectionViewCell
        
        cell.championName.text = "Name"
        return cell;
    }
    

    func fetchData(){
        let req = NSFetchRequest<Champion>(entityName: "Champion")
        req.propertiesToFetch = ["id"]
        
        do {
            championList = try mContext.fetch(req)
            print(championList.count)
            
        } catch let error as NSError {
            print("Could Not Save. \(error), \(error.userInfo)")
        }
        
    }

}
