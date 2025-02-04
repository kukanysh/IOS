//
//  SourceEditorCommand.swift
//  MyXcodePluginExtension
//
//  Created by Куаныш Спандияр on 23.01.2025.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
        let lines = invocation.buffer.lines
        lines.insert("// Plugin created by Kuanysh", at: 0)
        
        completionHandler(nil)
    }
    
}
