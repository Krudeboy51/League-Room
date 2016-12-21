//
//  ChampionCollection.swift
//  Leaguer
//
//  Created by user119166 on 12/8/16.
//  Copyright © 2016 krudeboy51. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class ChampionCollection{
    
    var ChampionList = [Champion]()
    
    var progress : UIProgressView!
    
    var mContext : NSManagedObjectContext!
    
    let champEntity : NSEntityDescription!
    
    
    init() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            mContext = appDelegate.persistentContainer.viewContext
        }
        
        champEntity = NSEntityDescription.entity(forEntityName: mGlobalConstants.ChampionDataBase, in: mContext)
        
        progress = UIProgressView()
    }
    
    func loadAllChampions(completionHandler: (([Dictionary<String, String>]) -> Void)? = nil){
        getAllChampionsFromURL(completionHandler: completionHandler)
    }
    
    
    //private
    
    private func createLink() -> URL?{
        var urlComp = URLComponents(string: mChampionConstants.link)
        var params = Dictionary<String, String>()
        params[mChampionConstants.linkquery.api] = mGlobalConstants.APIKEY
        params[mChampionConstants.linkquery.champData] = mChampionConstants.linkquery.all
        
        var queryItems = Array<NSURLQueryItem>()
        for (key, value) in params {
            queryItems.append(NSURLQueryItem(name: key, value: value))
        }
        
        urlComp?.queryItems = queryItems as [URLQueryItem]?
        print(urlComp?.string ?? "Error")
        return urlComp?.url
    }
    
    private func getAllChampionsFromURL(completionHandler: (([Dictionary<String, String>]) -> Void)? = nil){
        let url = createLink()
        
        
        Alamofire.request(url!).responseJSON{
            (data) 	-> Void in
            
            if ((data.result.value) != nil) {
                let swiftyJsonVar = JSON(data.result.value!)
                print(swiftyJsonVar["version"].string ?? "0.0.0")
                
                let mdata = swiftyJsonVar["data"].dictionaryValue
                
                print("Champion Count: \(mdata.count)")
                
                for item in mdata{
                    
                    let json = item.value
                    
                    //champion main
                    
                    do{
                        
                        let champion = Champion(entity: NSEntityDescription.entity(forEntityName: "Champion", in: self.mContext)!, insertInto: self.mContext)
                        
                        //GETTING CHAMPION DATA
                        champion.id = Int32(Int(json[mChampionConstants.championKeys.id].int!))
                        champion.name = json[mChampionConstants.championKeys.name].stringValue
                        
                        //CHECK IF EXIST
                        let i = champion.id

                        if self.exist(dataStore: mGlobalConstants.ChampionDataBase, cid: Int(i)){
                            print(champion.name!+" Exist!")
                            continue
                        }
                        
                        champion.key = json[mChampionConstants.championKeys.key].stringValue
                        champion.blurb = json[mChampionConstants.championKeys.blurb].stringValue
                        champion.title = json[mChampionConstants.championKeys.title].string
                        champion.partype = json[mChampionConstants.championKeys.partype].stringValue
                        champion.lore = json[mChampionConstants.championKeys.lore].stringValue
                        
                        print(champion.name!)
                        
                        //GETTING ALLYTIPS
                        for items in json[mChampionConstants.championKeys.allytips]{
                            let allytips = Ally(entity: NSEntityDescription.entity(forEntityName: "Ally", in: self.mContext)!, insertInto: self.mContext)
                            allytips.info = items.1.stringValue
                            champion.addToAllytips(allytips)
                        }
                        
                        //GETTING SKINS
                        for items in json[mChampionConstants.championKeys.skins]{
                            let skin = Skins(entity: NSEntityDescription.entity(forEntityName: "Skins", in: self.mContext)!, insertInto: self.mContext)
                            let things = items.1.dictionaryValue
                            skin.id = (things[mChampionConstants.skinsKeys.id]?.int32Value)!
                            skin.name = things[mChampionConstants.skinsKeys.name]?.stringValue
                            skin.num = (things[mChampionConstants.skinsKeys.num]?.int32Value)!
                            champion.addToSkins(skin)
                        }
                        
                        //GETTING PASSIVE
                        let items = json[mChampionConstants.championKeys.passive].dictionaryValue
                        let passive = Passive(entity: NSEntityDescription.entity(forEntityName: "Passive", in: self.mContext)!, insertInto: self.mContext)
                        let things = items
                        passive.name = things[mChampionConstants.passiveKeys.name]?.stringValue
                        passive.descriptionValue = things[mChampionConstants.passiveKeys.descriptionValue]?.stringValue
                        //GETTIING IMAGE
                        if let imgthing = things[mChampionConstants.passiveKeys.image]?.dictionaryValue{
                            let image = Imagedata(entity: NSEntityDescription.entity(forEntityName: "Imagedata", in: self.mContext)!, insertInto: self.mContext)
                            image.full = imgthing[mChampionConstants.imageKeys.full]?.stringValue
                            image.sprite = imgthing[mChampionConstants.imageKeys.sprite]?.stringValue
                            image.group = imgthing[mChampionConstants.imageKeys.group]?.stringValue
                            image.x = (imgthing[mChampionConstants.imageKeys.x]?.int32Value)!
                            image.y = (imgthing[mChampionConstants.imageKeys.y]?.int32Value)!
                            image.w = (imgthing[mChampionConstants.imageKeys.w]?.int32Value)!
                            image.h = (imgthing[mChampionConstants.imageKeys.h]?.int32Value)!
                            passive.image = image
                        }
                        champion.passive = passive
                        
                        //GETTING STATS
                        let statsj = json[mChampionConstants.championKeys.stats].dictionaryValue
                        let stats = Stats(entity: NSEntityDescription.entity(forEntityName: "Stats", in: self.mContext)!, insertInto: self.mContext)
                        stats.armorperlevel = (statsj[mChampionConstants.statsKeys.armorperlevel]?.floatValue)!
                        stats.hpregenperlevel = (statsj[mChampionConstants.statsKeys.hpregenperlevel]?.floatValue)!
                        stats.spellblock = (statsj[mChampionConstants.statsKeys.spellblock]?.floatValue)!
                        stats.hpregen = (statsj[mChampionConstants.statsKeys.hpregen]?.floatValue)!
                        stats.attackrange = (statsj[mChampionConstants.statsKeys.attackrange]?.floatValue)!
                        stats.spellblockperlevel = (statsj[mChampionConstants.statsKeys.spellblockperlevel]?.floatValue)!
                        stats.mp = (statsj[mChampionConstants.statsKeys.mp]?.floatValue)!
                        stats.hp = (statsj[mChampionConstants.statsKeys.hp]?.floatValue)!
                        stats.armor = (statsj[mChampionConstants.statsKeys.armor]?.floatValue)!
                        stats.hpperlevel = (statsj[mChampionConstants.statsKeys.hpperlevel]?.floatValue)!
                        stats.mpregen = (statsj[mChampionConstants.statsKeys.mpregen]?.floatValue)!
                        stats.mpregenperlevel = (statsj[mChampionConstants.statsKeys.mpregenperlevel]?.floatValue)!
                        stats.movespeed = (statsj[mChampionConstants.statsKeys.movespeed]?.floatValue)!
                        stats.crit = (statsj[mChampionConstants.statsKeys.crit]?.floatValue)!
                        stats.attackspeedperlevel = (statsj[mChampionConstants.statsKeys.attackspeedperlevel]?.floatValue)!
                        stats.critperlevel = (statsj[mChampionConstants.statsKeys.critperlevel]?.floatValue)!
                        stats.attackspeedofset = (statsj[mChampionConstants.statsKeys.attackspeedoffset]?.floatValue)!
                        stats.attackdamageperlevel = (statsj[mChampionConstants.statsKeys.attackdamageperlevel]?.floatValue)!
                        stats.mpperlevel = (statsj[mChampionConstants.statsKeys.mpperlevel]?.floatValue)!
                        stats.attackdamage = (statsj[mChampionConstants.statsKeys.attackdamage]?.floatValue)!
                        champion.stats = stats
                        
                        //GETTING RECOMMENDED
                        for itemsj in json[mChampionConstants.championKeys.recommended]{
                            let rec = Recommended(entity: NSEntityDescription.entity(forEntityName: "Recommended", in: self.mContext)!, insertInto: self.mContext)
                            let items = itemsj.1.dictionaryValue
                            rec.title = items[mChampionConstants.recommendedKeys.title]?.stringValue
                            rec.mode = items[mChampionConstants.recommendedKeys.mode]?.stringValue
                            rec.type = items[mChampionConstants.recommendedKeys.type]?.stringValue
                            rec.map = items[mChampionConstants.recommendedKeys.map]?.stringValue
                        }
                        
                        //GETTING TAGS
                        for items in json[mChampionConstants.championKeys.tags]{
                            let tags = Tags(entity: NSEntityDescription.entity(forEntityName: "Tags", in: self.mContext)!, insertInto: self.mContext)
                            tags.info = items.1.stringValue
                            champion.addToTags(tags)
                        }
                        
                        //GETING IMAGE
                        let imgthing = things[mChampionConstants.championKeys.image]?.dictionaryValue
                        let image = Imagedata(entity: NSEntityDescription.entity(forEntityName: "Imagedata", in: self.mContext)!, insertInto: self.mContext)
                        image.full = imgthing?[mChampionConstants.imageKeys.full]?.stringValue
                        image.sprite = imgthing?[mChampionConstants.imageKeys.sprite]?.stringValue
                        image.group = imgthing?[mChampionConstants.imageKeys.group]?.stringValue
                        image.x = (imgthing?[mChampionConstants.imageKeys.x]?.int32Value)!
                        image.y = (imgthing?[mChampionConstants.imageKeys.y]?.int32Value)!
                        image.w = (imgthing?[mChampionConstants.imageKeys.w]?.int32Value)!
                        image.h = (imgthing?[mChampionConstants.imageKeys.h]?.int32Value)!
                        champion.image = image
                        
                        
                        //GETTING ENEMYTIPS
                        for items in json[mChampionConstants.championKeys.enemytips]{
                            let enemytips = Enemy(entity: NSEntityDescription.entity(forEntityName: "Enemy", in: self.mContext)!, insertInto: self.mContext)
                            enemytips.info = items.1.stringValue
                            champion.addToEnemytips(enemytips)
                        }
                        
                        
                        //GETTING INFO
                        let thing = json[mChampionConstants.championKeys.info].dictionaryValue
                        let info = Info(entity: NSEntityDescription.entity(forEntityName: "Info", in: self.mContext)!, insertInto: self.mContext)
                        info.defense = (thing[mChampionConstants.infoKeys.defense]?.int32Value)!
                        info.attack = (thing[mChampionConstants.infoKeys.attack]?.int32Value)!
                        info.difficulty = (thing[mChampionConstants.infoKeys.difficulty]?.int32Value)!
                        info.magic = (thing[mChampionConstants.infoKeys.magic]?.int32Value)!
                        champion.info = info
                        
                        //GETTING SPELLS
                        for item in json[mChampionConstants.championKeys.spells]{
                            let spells = Spells(entity: NSEntityDescription.entity(forEntityName: "Spells", in: self.mContext)!, insertInto: self.mContext)
                            let spellD = item.1.dictionaryValue
                            spells.name = spellD[mChampionConstants.spellsKeys.name]?.stringValue
                            spells.descriptionValue = spellD[mChampionConstants.spellsKeys.descriptionValue]?.stringValue
                            spells.costtype = spellD[mChampionConstants.spellsKeys.costType]?.stringValue
                            spells.key = spellD[mChampionConstants.spellsKeys.key]?.stringValue
                            
                            //GETTIING IMAGE
                            if let imgthing = things[mChampionConstants.passiveKeys.image]?.dictionaryValue{
                                let image = Imagedata(entity: NSEntityDescription.entity(forEntityName: "Imagedata", in: self.mContext)!, insertInto: self.mContext)
                                image.full = imgthing[mChampionConstants.imageKeys.full]?.stringValue
                                image.sprite = imgthing[mChampionConstants.imageKeys.sprite]?.stringValue
                                image.group = imgthing[mChampionConstants.imageKeys.group]?.stringValue
                                image.x = (imgthing[mChampionConstants.imageKeys.x]?.int32Value)!
                                image.y = (imgthing[mChampionConstants.imageKeys.y]?.int32Value)!
                                image.w = (imgthing[mChampionConstants.imageKeys.w]?.int32Value)!
                                image.h = (imgthing[mChampionConstants.imageKeys.h]?.int32Value)!
                                spells.image = image
                            }
                            
                        }
                        print(champion)
                        try self.mContext.save()
                        
                    }catch{
                        fatalError("Error Uploading")
                    }
                    
                }
                
            }
        }
    }
    
    func deletefromDataBase(championData: Champion){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let mContext = appDelegate.persistentContainer.viewContext
        
        mContext.delete(championData)
        
        do{
            try mContext.save()
        }catch{
            let error_S = error as NSError
            print("Delete Error: \(error_S)")
        }
    }
    
    func exist(dataStore : String, cid : Int) -> Bool{
        
        let req = NSFetchRequest<Champion>(entityName: "Champion")
        
        let predicate  = NSPredicate(format: "id == %d", cid)
        
        req.predicate = predicate
        
        do {
            
            var res = try self.mContext.fetch(req) 
            
            if res.count > 0 {
                if res.count != 1{
                    for i in 1..<res.count{
                        res.remove(at: i)
                        print("poplast")
                    }
                    try self.mContext.save()
                }
                return true
            }
            
        } catch let error as NSError {
            print("Could Not Save. \(error), \(error.userInfo)")
        }
        
        return false
    }
    
}
