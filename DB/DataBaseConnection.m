//
//  DataBaseConnection.m
//  SixGroups
//
//  Created by sixcroresapp on 1/16/14.
//  Copyright (c) 2014 SixGroups. All rights reserved.
//

#import "DataBaseConnection.h"

@implementation DataBaseConnection
@synthesize database;


- (void)fnCopyDatabase {
    
    @try {
        
        BOOL success;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"dbTest.sqlite"];
        NSLog(@"writableDBPath %@",writableDBPath);
        success = [fileManager fileExistsAtPath:writableDBPath];
        
        if (success) return;
        
        // The writable database does not exist, so copy the default to the appropriate location.
        defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"dbTest.sqlite"];
        
        success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success) {
            NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
        }
        NSLog(@"defaultDBPath ~~~~~~~%@",defaultDBPath);
    }
    @catch (NSException * e) {
        NSLog(@"Exception %@",e);
    }
    
}

- (NSString *) fnGetDBPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    
    NSLog(@"documentsDir stringByAppendingPathComponent:Dummy.sqlite %@",[documentsDir stringByAppendingPathComponent:@"Dummy.sqlite"]);
    return [documentsDir stringByAppendingPathComponent:@"dbTest.sqlite"];
    
}

-(void) fnInitializeDB {
    
    @try {
        if (sqlite3_open([[self fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
        } else {
            sqlite3_close(database);
            NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception %@",e);
    }
}

-(void)fnCloseDB {
    
    @try {
        sqlite3_close(database);
    }
    @catch (NSException * e) {
        NSLog(@"Exception %@",e);
    }
}
@end
