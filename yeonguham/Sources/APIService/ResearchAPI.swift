//
//  ResearchAPI.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/16.
//

import Foundation
import Moya



enum ResearchAPI {
    
    // Research
    case getResearches // HOME
    case getResearch(id: Int)
    case postResearch(research: Research)
    case updateResearch(id: Int, research: Research)
    case deleteResearch(id: Int)
    
    
    // Recommendation
    case recommendations(page: Int, sort: String)
    

    
    // Research Participate
    case applyResearch
    
    
    // Notices
    case getNotices
    case getNotice(id: Int)
    case postNotice
    case deleteNotice(postId: Int, noticeId: Int)
    
}


extension ResearchAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: BaseAPI.baseURL)!
    }
    
    var path: String {
        
        switch self {
        case .getResearches, .postResearch:
            return "researches"
        case .getResearch(let id), .updateResearch(let id, _), .deleteResearch(let id):
            return "researches/\(id)"
        default:
            return ""
        }
        
    } // End of path
    
    
    var method: Moya.Method {
        
        switch self {
        case .getResearch, .getResearches:
            return .get
        case .postResearch:
            return .post
        case .updateResearch:
            return .put
        case .deleteResearch:
            return .delete
        default:
            return .get
        }

    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {

        switch self {
        case .getResearch, .getResearches:
            return .requestPlain
        case .postResearch(let research), .updateResearch( _, let research):
            return .requestParameters(parameters: research.params , encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
