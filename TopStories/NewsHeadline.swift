//
//  NewsHeadline.swift
//  TopStories
//
//  Created by Chakane Shegog on 9/9/21.
//  Copyright © 2021 Alex Paul. All rights reserved.
//

import Foundation


// multiple struct points us to different parts of json
struct HeadlinesData: Codable {  // codable, so we can use our json data
    let results: [NewsHeadline] // this represents the JSON array of articles (stories)
}

struct NewsHeadline: Codable {
    let title: String
    let abstract: String
    let byline: String
}


extension HeadlinesData {
    
    // this function will return an array of [NewsHeadlines]
    static func getHeadlines() -> [NewsHeadline] {
        var headlines = [NewsHeadline]()
        
        // this is a url ewhich is a path for our json file
        guard let fileUrl = Bundle.main.url(forResource: "topStoriesTechnology", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileUrl)
            let topStoriesData = try JSONDecoder().decode(HeadlinesData.self, from: data)
            headlines = topStoriesData.results
        } catch {
           fatalError("ok, contents failed to load: \(error)")
        }
        
        return headlines
    }
}
