//
//  MyInstallerPane.m
//  LearningPlugins
//
//  Created by Куаныш Спандияр on 23.01.2025.
//

#import "MyInstallerPane.h"

@implementation MyInstallerPane

- (NSString *)title
{
    return [[NSBundle bundleForClass:[self class]] localizedStringForKey:@"PaneTitle" value:nil table:nil];
}

@end
