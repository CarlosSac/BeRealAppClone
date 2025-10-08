//
//  Comment.swift
//  BeRealAppClone
//
//  Created by Carlos Sac on 10/8/25.
//
import Foundation
import ParseSwift

struct Comment: ParseObject {
    // Required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Custom properties
    var text: String?
    var user: User?
    var post: Post?
}
