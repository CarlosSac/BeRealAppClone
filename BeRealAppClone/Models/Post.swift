//
//  Post.swift
//  BeRealAppClone
//
//  Created by Carlos Sac on 10/1/25.
//

import Foundation
import ParseSwift


struct Post: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    var caption: String?
    var user: User?
    var imageFile: ParseFile?
    var authorUsername: String?
    
    var location: String?
}
