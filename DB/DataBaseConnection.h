//
//  DataBaseConnection.h
//  SixGroups
//
//  Created by sixcroresapp on 1/16/14.
//  Copyright (c) 2014 SixGroups. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DataBaseConnection : NSObject {
    NSString *defaultDBPath;

    sqlite3 *database;
}

@property (nonatomic) sqlite3 *database;

- (void)fnCopyDatabase;
- (void) fnInitializeDB;
- (NSString *) fnGetDBPath;
- (void)fnCloseDB;

@end
