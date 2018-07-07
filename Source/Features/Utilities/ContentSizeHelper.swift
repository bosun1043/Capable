//
//  ContentSizeHelper.swift
//  Capable
//
//  Created by Christoph Wendt on 07.07.18.
//

import Foundation

class ContentSizeHelper {
    
    #if os(iOS)
    static func isDefaultContentSizeCategory(contentSizeCategory: UIContentSizeCategory): Bool {
        return contentSizeCategory == .medium
    }
    #endif
    
    #if os(watchOS)
    struct DefaultContentSize {
        // 38mm
        let small = "UICTContentSizeCategoryS"
        // 42mm
        let large = "UICTContentSizeCategoryL"
    }
    
    static func isDefaultContentSize(contentSize: String): Bool {
        let watchSize = WKInterfaceDevice.current().preferredContentSizeCategory
        if watchSize == DefaultContentSize.small {
            return contentSize == "S"
        } else if watchSize == DefaultContentSize.large {
            return contentSize == "L"
        } else {
            return false
        }
    }
    #endif
    
}
