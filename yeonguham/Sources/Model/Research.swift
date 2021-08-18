//
//  Research.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/16.
//

import Foundation


struct Research: Codable {
    
    let subject, createDate, updateDate, recruitStart: String
    let recruitEnd, researchStart, researchEnd: String
    let link: String
    let detail, requirement: String
    let capacity: Int
    let tags: [String]
    let location: String
    let reward: [String: String]

    enum CodingKeys: String, CodingKey {
        case subject
        case createDate = "create_date"
        case updateDate = "update_date"
        case recruitStart = "recruit_start"
        case recruitEnd = "recruit_end"
        case researchStart = "research_start"
        case researchEnd = "research_end"
        case link, detail, requirement, capacity, tags, location, reward
    }
    
    var params: [String: Any] {
        
        return [
            CodingKeys.subject.rawValue : subject,
            CodingKeys.createDate.rawValue : createDate,
            CodingKeys.updateDate.rawValue : updateDate,
            CodingKeys.recruitStart.rawValue : recruitStart,
            CodingKeys.recruitEnd.rawValue : recruitEnd,
            CodingKeys.researchStart.rawValue : researchStart,
            CodingKeys.researchEnd.rawValue : researchEnd,
            CodingKeys.link.rawValue : link,
            CodingKeys.detail.rawValue : detail,
            CodingKeys.requirement.rawValue : requirement,
            CodingKeys.capacity.rawValue : capacity,
            CodingKeys.tags.rawValue : tags,
            CodingKeys.location.rawValue : location,
            CodingKeys.reward.rawValue : reward
        ]
    }
    
}

