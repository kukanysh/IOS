//
//  SourceEditorCommand.swift
//  PanDevMetricsExtension
//
//  Created by Куаныш Спандияр on 24.01.2025.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        let lines = invocation.buffer.lines
        print("File content: \(lines)")
        
        
        completionHandler(nil)
    }
    
}
