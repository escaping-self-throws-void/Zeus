//
//  ConditionList.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

enum ConditionList {
    static let iconTable =
    [
        1000: 113,
        1003: 116,
        1006: 119,
        1009: 122,
        1030: 143,
        1063: 176,
        1066: 179,
        1069: 182,
        1072: 185,
        1087: 200,
        1114: 227,
        1117: 230,
        1135: 248,
        1147: 260,
        1150: 263,
        1153: 266,
        1168: 281,
        1171: 284,
        1180: 293,
        1183: 296,
        1186: 299,
        1189: 302,
        1192: 305,
        1195: 308,
        1198: 311,
        1201: 314,
        1204: 317,
        1207: 320,
        1210: 323,
        1213: 326,
        1216: 329,
        1219: 332,
        1222: 335,
        1225: 338,
        1237: 350,
        1240: 353,
        1243: 356,
        1246: 359,
        1249: 362,
        1252: 365,
        1255: 368,
        1258: 371,
        1261: 374,
        1264: 377,
        1273: 386,
        1276: 389,
        1279: 392,
        1282: 395
    ]
    
    static func getIconCode(by keyCode: Int) -> Int {
        iconTable[keyCode] ?? 116
    }
    
    static func getAnimation(by keyCode: Int) -> String {
        switch keyCode {
        case 1003:
            return "fewClouds"
        case 1006:
            return "scatteredClouds"
        case 1009:
            return "brokenClouds"
        case 1030:
            return "mist"
        case 1063, 1150, 1153, 1168, 1171, 1180, 1183, 1186, 1189, 1192, 1195:
            return "rain"
        case 1066, 1198:
            return "snow"
        case 1087:
            return "thunderstorm"
        case 1240:
            return "showerRains"
        default:
            return "clearSky"
        }
    }
}
