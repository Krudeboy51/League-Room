//
//  mChampionConstants.swift
//  Leaguer
//
//  Created by Krudeboy51 on 12/16/16.
//  Copyright © 2016 krudeboy51. All rights reserved.
//

import Foundation


struct mChampionConstants{
    
    static let link = "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?"
    
    static let squareImgLinkH = "http://ddragon.leagueoflegends.com/cdn/6.24.1/img/champion/"
    
    struct linkquery {
        static let api = "api_key"
        static let champData = "champData"
        static let image = "image"
        static let tags = "tags"
        static let all = "all"
        //static let id = "id"
        
    }
    
    struct results{
        static let data = "data"
        static let id = "id"
        static let name = "name"
        static let title = "title"
        static let image = "image"
        static let full = "full"
        static let sprite = "sprite"
        static let group = "group"
        static let champion = "champion"
    }
    
    struct championKeys {
        static let allytips = "allytips"
        static let name = "name"
        static let key = "key"
        static let blurb = "blurb"
        static let skins = "skins"
        static let passive = "passive"
        static let stats = "stats"
        static let recommended = "recommended"
        static let tags = "tags"
        static let partype = "partype"
        static let id = "id"
        static let image = "image"
        static let enemytips = "enemytips"
        static let lore = "lore"
        static let info = "info"
        static let spells = "spells"
        static let title = "title"
    }
    
    struct blockKeys {
        static let type = "type"
        static let recMath = "recMath"
        static let items = "items"
    }
    
    struct imageKeys {
        static let w = "w"
        static let full = "full"
        static let sprite = "sprite"
        static let x = "x"
        static let y = "y"
        static let h = "h"
        static let group = "group"
    }
    
    struct infoKeys {
        static let defense = "defense"
        static let attack = "attack"
        static let difficulty = "difficulty"
        static let magic = "magic"
    }
    
    struct itemsKeys {
        static let id = "id"
        static let count = "count"
    }
    
    struct levelTipKeys {
        static let label = "label"
        static let effect = "effect"
    }
    
    struct passiveKeys {
        static let descriptionValue = "description"
        static let sanitizedDescription = "sanitizedDescription"
        static let name = "name"
        static let image = "image"
    }
    
    struct recommendedKeys {
        static let blocks = "blocks"
        static let title = "title"
        static let mode = "mode"
        static let type = "type"
        static let map = "map"
        static let champion = "champion"
    }
    
    struct skinsKeys {
        static let id = "id"
        static let name = "name"
        static let num = "num"
    }
    
    struct spellsKeys {
       
        static let name = "name"
        static let cooldown = "cooldown"
        static let key = "key"
        static let descriptionValue = "description"
        static let tooltip = "tooltip"
        static let leveltip = "leveltip"
        static let image = "image"
        static let costType = "costType"
    }
    
    struct statsKeys {
        static let armorperlevel = "armorperlevel"
        static let hpregenperlevel = "hpregenperlevel"
        static let spellblock = "spellblock"
        static let hpregen = "hpregen"
        static let attackrange = "attackrange"
        static let spellblockperlevel = "spellblockperlevel"
        static let mp = "mp"
        static let hp = "hp"
        static let armor = "armor"
        static let hpperlevel = "hpperlevel"
        static let mpregen = "mpregen"
        static let mpregenperlevel = "mpregenperlevel"
        static let movespeed = "movespeed"
        static let crit = "crit"
        static let attackspeedperlevel = "attackspeedperlevel"
        static let critperlevel = "critperlevel"
        static let attackspeedoffset = "attackspeedoffset"
        static let attackdamageperlevel = "attackdamageperlevel"
        static let mpperlevel = "mpperlevel"
        static let attackdamage = "attackdamage"
    }
    
    struct varsKeys {
        static let key = "key"
        static let link = "link"
        static let coeff = "coeff"
    }
}
