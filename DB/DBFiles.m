//
//  DBFiles.m
//  SixGroups
//
//  Created by sixcroresapp on 1/16/14.
//  Copyright (c) 2014 SixGroups. All rights reserved.
//


#import "DBFiles.h"

@implementation DBFiles

@synthesize pStrLoginStatus;
@synthesize primaryKey, iFavourite,pUserId,pCustomerID;
@synthesize pstrName,pstrAge,pstrCity,pstrCommunity,pstrCompany,pstrComplexion,pstrCountry,pstrDosam,pstrDrinking,pstrFamilyStatus,pstrFamilyType,pstrFamilyValue,pstrFood,pstrHeight,pstrHobbies,pstrImagePath,pstrMaritalStatus,pstrMotherTongue,pstrPhysicalStatus,pstrPorutham,pstrQualification,pstrRaasi,pstrReligion,pstrSalary,pstrSmoking,pstrStar,pstrState,pstrUserid,pstrWeight;

static sqlite3_stmt *fav_update_statement = nil;

//Array insert into SQLite

- (BOOL)fnRegister:(NSMutableArray *)pArrMessage {

    LocalDBViewController *oLocalDBViewController = [[LocalDBViewController alloc]init];
    
    oLocalDBViewController = [pArrMessage objectAtIndex:0];
    
    DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];

    @try {
        if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
            
                NSString *updateSql = [NSString stringWithFormat: @"INSERT INTO Marriage (Name,Age,City, Community, Company, Complexion, Country, Dosam, Drinking, FamilyStatus, FamilyType, FamilyValue, Food, Height, Hobbies, ImagePath, MaritalStatus, MotherTongue, PhysicalStatus, Porutham, Qualification, Raasi, Religion, Salary, Smoking, Star, State, Userid, Weight) VALUES ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",oLocalDBViewController.pstrName,oLocalDBViewController.pstrAge,oLocalDBViewController.pstrCity,oLocalDBViewController.pstrCommunity,oLocalDBViewController.pstrCompany,oLocalDBViewController.pstrComplexion,oLocalDBViewController.pstrCountry,oLocalDBViewController.pstrDosam,oLocalDBViewController.pstrDrinking,oLocalDBViewController.pstrFamilyStatus,oLocalDBViewController.pstrFamilyType,oLocalDBViewController.pstrFamilyValue,oLocalDBViewController.pstrFood,oLocalDBViewController.pstrHeight,oLocalDBViewController.pstrHobbies,oLocalDBViewController.pstrImagePath,oLocalDBViewController.pstrMaritalStatus,oLocalDBViewController.pstrMotherTongue,oLocalDBViewController.pstrPhysicalStatus,oLocalDBViewController.pstrPorutham,oLocalDBViewController.pstrQualification,oLocalDBViewController.pstrRaasi,oLocalDBViewController.pstrReligion,oLocalDBViewController.pstrSalary,oLocalDBViewController.pstrSmoking,oLocalDBViewController.pstrStar,oLocalDBViewController.pstrState,oLocalDBViewController.pstrUserid,oLocalDBViewController.pstrWeight];
                const char *sql = [updateSql UTF8String];
                //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
                if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement, NULL) != SQLITE_OK) {
                    NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
                }
            
            NSLog(@"Successfully Registered or not");
            
            int success = sqlite3_step(fav_update_statement);
            if (success != SQLITE_DONE) {
                NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
            }
            sqlite3_reset(fav_update_statement);
            sqlite3_close(database);
            
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception in Db %@",exception);
    }
    @finally {
        
    }
    
    return YES;
}


/// get the datas from sqlite


- (NSMutableArray *)fnGetDetails {
    
   @try {
        DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
        [oDBCon fnInitializeDB];
        oDBFiles = [[DBFiles alloc]init];

       pArrDetails = [[NSMutableArray alloc] init];
        
        NSString *sQryAuthor = [NSString stringWithFormat:@"SELECT * FROM Marriage"];
        sqlite3_stmt *selectstmt;
        
        if(sqlite3_prepare_v2(oDBCon.database, [sQryAuthor UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) {
            
            while(sqlite3_step(selectstmt) == SQLITE_ROW) {
                
                primaryKey = sqlite3_column_int(selectstmt, 0);
                oDBFiles = [[DBFiles alloc]initWithPrimaryKey:primaryKey database:oDBCon.database];
                
                
                oDBFiles.pstrName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                
                oDBFiles.pstrAge = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
                oDBFiles.pstrCity = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)];
                oDBFiles.pstrCommunity = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 4)];
                oDBFiles.pstrCompany = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 5)];
                oDBFiles.pstrComplexion = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 6)];
                oDBFiles.pstrCountry = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 7)];
                oDBFiles.pstrDosam = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 8)];
                oDBFiles.pstrDrinking = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 9)];
                oDBFiles.pstrFamilyStatus = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 10)];
                oDBFiles.pstrFamilyType = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 11)];
                oDBFiles.pstrFamilyValue = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 12)];
                oDBFiles.pstrFood = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 13)];
                oDBFiles.pstrHeight = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 14)];
                oDBFiles.pstrHobbies = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 15)];
                oDBFiles.pstrImagePath = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 16)];
                oDBFiles.pstrMaritalStatus = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 17)];
                oDBFiles.pstrMotherTongue = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 18)];
                oDBFiles.pstrPhysicalStatus = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 19)];
                oDBFiles.pstrPorutham = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 20)];
                oDBFiles.pstrQualification = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 21)];
                oDBFiles.pstrRaasi = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 22)];
                oDBFiles.pstrReligion = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 23)];
                oDBFiles.pstrSalary = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 24)];
                oDBFiles.pstrSmoking = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 25)];
                oDBFiles.pstrStar = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 26)];
                oDBFiles.pstrState = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 27)];
                oDBFiles.pstrUserid = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 28)];
                oDBFiles.pstrWeight = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 29)];

                NSLog(@"odb files pstrState %@",oDBFiles.pstrState);
                [pArrDetails addObject:oDBFiles];
                
            }
            
        } else {
            
            NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(oDBCon.database));
        }
        sqlite3_finalize(selectstmt);
        [oDBCon fnCloseDB];
        
        return pArrDetails;
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception Error is %@",exception);
    }
    @finally {
        
    }


    
    
}

/* use this function for Update and get string SQLite
 
 
 
 - (BOOL) fnUpdateStatus:(NSString*)pCustomerId {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 @try {
 
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 if (fav_update_statement2 == nil) {
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tbldetails SET loginstatus=1,userid='%@' WHERE id=1",pCustomerId];
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement2, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 }
 
 
 int success = sqlite3_step(fav_update_statement2);
 if (success != SQLITE_DONE) {
 
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 
 } else {
 
 }
 sqlite3_reset(fav_update_statement2);
 sqlite3_close(database);
 
 }
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 return YES;
 }
 
 - (BOOL) fnUpdateLogOut {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 sqlite3_stmt *fav_update_statement = nil;
 
 if(sqlite3_open([[oDBCon fnGetDBPath] UTF8String],&database)==SQLITE_OK)
 {
 
 NSString *sqlStmt=[NSString stringWithFormat:@"UPDATE tbldetails SET loginstatus=0,userid='0' WHERE id=1"];
 if(sqlite3_prepare_v2(database, [sqlStmt UTF8String],-1,&fav_update_statement, NULL)==SQLITE_OK)
 {
 }
 sqlite3_step(fav_update_statement);
 sqlite3_close(database);
 }
 
 return YES;
 
 }
 
 - (NSString *)fnGetLoginStatus {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 [oDBCon fnInitializeDB];
 oDBFiles = [[DBFiles alloc]init];
 NSString *sQryAuthor = [NSString stringWithFormat:@"SELECT  *FROM tbldetails"];
 sqlite3_stmt *selectstmt;
 if(sqlite3_prepare_v2(oDBCon.database, [sQryAuthor UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) {
 
 while(sqlite3_step(selectstmt) == SQLITE_ROW) {
 
 @try {
 primaryKey = sqlite3_column_int(selectstmt, 0);
 oDBFiles = [[DBFiles alloc]initWithPrimaryKey:primaryKey database:oDBCon.database];
 
 pStrLoginStatus = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
 pCustomerID = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
 
 } @catch (NSException *exception) {
 
 NSLog(@"Exception Error %@",exception);
 
 } @finally {
 
 }
 
 }
 
 } else {
 
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(oDBCon.database));
 }
 sqlite3_finalize(selectstmt);
 [oDBCon fnCloseDB];
 return pStrLoginStatus;
 }
 
 - (BOOL)fnGetRegisterDetails {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 [oDBCon fnInitializeDB];
 oDBFiles = [[DBFiles alloc]init];
 NSString *sQryAuthor = [NSString stringWithFormat:@"SELECT *FROM tblRegister"];
 sqlite3_stmt *selectstmt;
 if(sqlite3_prepare_v2(oDBCon.database, [sQryAuthor UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) {
 
 while(sqlite3_step(selectstmt) == SQLITE_ROW) {
 
 @try {
 
 primaryKey = sqlite3_column_int(selectstmt, 0);
 oDBFiles = [[DBFiles alloc]initWithPrimaryKey:primaryKey database:oDBCon.database];
 
 pStrRegisterUserName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
 NSLog(@"pStrRegisterUserName %@",pStrRegisterUserName);
 pStrRegisterMobileNumber = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
 NSLog(@"pStrRegisterMobileNumber %@",pStrRegisterMobileNumber);
 
 
 } @catch (NSException *exception) {
 
 NSLog(@"Exception Error %@",exception);
 
 } @finally {
 
 }
 
 }
 
 } else {
 
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(oDBCon.database));
 }
 sqlite3_finalize(selectstmt);
 [oDBCon fnCloseDB];
 return pStrLoginStatus;
 }
 
 - (BOOL)fnRegister:(NSMutableArray *)pArrRegisterDetails {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 NSString *pStrName = [pArrRegisterDetails objectAtIndex:0];
 NSString *pStrMobile = [pArrRegisterDetails objectAtIndex:1];
 
 @try {
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 if (fav_update_statement == nil) {
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tblRegister SET name='%@',mobilenumber='%@' WHERE id=1",pStrName,pStrMobile];
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 }
 
 NSLog(@"Successfully Registered or not");
 
 int success = sqlite3_step(fav_update_statement);
 if (success != SQLITE_DONE) {
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 }
 sqlite3_reset(fav_update_statement);
 sqlite3_close(database);
 
 }
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 return YES;
 }

 
 
 
 - (NSMutableArray *)fnGetEngFav {
 
 @try {
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 [oDBCon fnInitializeDB];
 oDBFiles = [[DBFiles alloc]init];
 
 pArrEngFav = [[NSMutableArray alloc] init];
 
 NSString *sQryAuthor = [NSString stringWithFormat:@"SELECT * FROM tbl_EnglishQuotes WHERE Bookmarks = '1'"];
 sqlite3_stmt *selectstmt;
 
 if(sqlite3_prepare_v2(oDBCon.database, [sQryAuthor UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) {
 
 while(sqlite3_step(selectstmt) == SQLITE_ROW) {
 
 primaryKey = sqlite3_column_int(selectstmt, 0);
 oDBFiles = [[DBFiles alloc]initWithPrimaryKey:primaryKey database:oDBCon.database];
 
 oDBFiles.pStrQuoteId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 0)];
 oDBFiles.pStrQuote = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
 oDBFiles.pStrBookmark = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
 
 
 [pArrEngFav addObject:oDBFiles];
 
 }
 
 } else {
 
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(oDBCon.database));
 }
 sqlite3_finalize(selectstmt);
 [oDBCon fnCloseDB];
 
 return pArrEngFav;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception Error is %@",exception);
 }
 @finally {
 
 }
 
 }
 
 - (NSMutableArray *)fnGetTamilFav {
 
 @try {
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 [oDBCon fnInitializeDB];
 oDBFiles = [[DBFiles alloc]init];
 
 pArrTamilFav = [[NSMutableArray alloc] init];
 
 NSString *sQryAuthor = [NSString stringWithFormat:@"SELECT * FROM tbl_Quotes WHERE Bookmarks = '1'"];
 sqlite3_stmt *selectstmt;
 if(sqlite3_prepare_v2(oDBCon.database, [sQryAuthor UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) {
 
 while(sqlite3_step(selectstmt) == SQLITE_ROW) {
 
 primaryKey = sqlite3_column_int(selectstmt, 0);
 oDBFiles = [[DBFiles alloc]initWithPrimaryKey:primaryKey database:oDBCon.database];
 
 oDBFiles.pStrQuoteId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 0)];
 oDBFiles.pStrQuote = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
 oDBFiles.pStrBookmark = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
 
 
 [pArrTamilFav addObject:oDBFiles];
 
 }
 
 } else {
 
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(oDBCon.database));
 }
 sqlite3_finalize(selectstmt);
 [oDBCon fnCloseDB];
 
 return pArrTamilFav;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception Error is %@",exception);
 }
 @finally {
 
 }
 }
 
 
 
 - (NSMutableArray *)fnGetEnglishQuotes {
 @try {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 [oDBCon fnInitializeDB];
 oDBFiles = [[DBFiles alloc]init];
 
 pArrEngQuotes = [[NSMutableArray alloc] init];
 
 NSString *sQryAuthor = [NSString stringWithFormat:@"SELECT * FROM tbl_EnglishQuotes"];
 sqlite3_stmt *selectstmt;
 if(sqlite3_prepare_v2(oDBCon.database, [sQryAuthor UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) {
 
 while(sqlite3_step(selectstmt) == SQLITE_ROW) {
 
 primaryKey = sqlite3_column_int(selectstmt, 0);
 oDBFiles = [[DBFiles alloc]initWithPrimaryKey:primaryKey database:oDBCon.database];
 
 oDBFiles.pStrQuoteId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 0)];
 oDBFiles.pStrQuote = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
 oDBFiles.pStrBookmark = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
 
 
 [pArrEngQuotes addObject:oDBFiles];
 
 }
 
 } else {
 
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(oDBCon.database));
 }
 sqlite3_finalize(selectstmt);
 [oDBCon fnCloseDB];
 
 return pArrEngQuotes;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception Error is %@",exception);
 }
 @finally {
 
 }
 
 }
 
 
 - (BOOL) fnUpdateBookMark:(NSString*)pstrQuoteIdFav {
 
 
 @try {
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 NSLog(@"come here for Upadete BookMark ");
 
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tbl_EnglishQuotes SET Bookmarks='1' WHERE id='%@'",pstrQuoteIdFav];
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement2, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 
 
 int success = sqlite3_step(fav_update_statement2);
 if (success != SQLITE_DONE) {
 
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 
 } else {
 
 }
 sqlite3_reset(fav_update_statement2);
 sqlite3_close(database);
 
 }
 return YES;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 
 }
 
 
 
 - (BOOL) fnRemoveBookMark:(NSString*)pstrQuoteIdFav {
 
 
 @try {
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 NSLog(@"come here ");
 
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tbl_EnglishQuotes SET Bookmarks='0' WHERE id='%@'",pstrQuoteIdFav];
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement2, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 
 
 int success = sqlite3_step(fav_update_statement2);
 if (success != SQLITE_DONE) {
 
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 
 } else {
 
 }
 sqlite3_reset(fav_update_statement2);
 sqlite3_close(database);
 
 }
 
 return YES;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 
 }
 
 
 - (BOOL) fnRemoveFavouriteBookMark:(NSString*)pStrBokRemoveId {
 
 
 @try {
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 NSLog(@"come here ");
 
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tbl_EnglishQuotes SET Bookmarks='0' WHERE id='%@'",pStrBokRemoveId];
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement2, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 
 
 int success = sqlite3_step(fav_update_statement2);
 if (success != SQLITE_DONE) {
 
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 
 } else {
 
 }
 sqlite3_reset(fav_update_statement2);
 sqlite3_close(database);
 
 }
 return YES;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 
 }
 
 - (BOOL) fnRemoveTamilFavouriteBookMark:(NSString*)pStrBokRemoveId {
 
 
 @try {
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tbl_Quotes SET Bookmarks='0' WHERE id='%@'",pStrBokRemoveId];
 
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement2, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 
 
 int success = sqlite3_step(fav_update_statement2);
 if (success != SQLITE_DONE) {
 
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 
 } else {
 
 }
 sqlite3_reset(fav_update_statement2);
 sqlite3_close(database);
 
 }
 return YES;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 
 
 }
 
 
 - (NSMutableArray *)fnGetTamilQuotes {
 @try {
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 [oDBCon fnInitializeDB];
 oDBFiles = [[DBFiles alloc]init];
 
 pArrEngQuotes = [[NSMutableArray alloc] init];
 
 NSString *sQryAuthor = [NSString stringWithFormat:@"SELECT * FROM tbl_Quotes"];
 sqlite3_stmt *selectstmt;
 if(sqlite3_prepare_v2(oDBCon.database, [sQryAuthor UTF8String], -1, &selectstmt, NULL) == SQLITE_OK) {
 
 while(sqlite3_step(selectstmt) == SQLITE_ROW) {
 
 primaryKey = sqlite3_column_int(selectstmt, 0);
 oDBFiles = [[DBFiles alloc]initWithPrimaryKey:primaryKey database:oDBCon.database];
 
 oDBFiles.pStrQuoteId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 0)];
 oDBFiles.pStrQuote = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
 oDBFiles.pStrBookmark = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
 
 
 [pArrEngQuotes addObject:oDBFiles];
 
 }
 
 } else {
 
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(oDBCon.database));
 }
 sqlite3_finalize(selectstmt);
 [oDBCon fnCloseDB];
 
 return pArrEngQuotes;
 
 }
 @catch (NSException *exception) {
 NSLog(@"Exception Error is %@",exception);
 }
 @finally {
 
 }
 }
 
 
 - (BOOL) fnUpdateTamilBookMark:(NSString*)pstrTamilQuoteIdFav {
 
 
 @try {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tbl_Quotes SET Bookmarks='1' WHERE id='%@'",pstrTamilQuoteIdFav];
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement2, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 
 
 int success = sqlite3_step(fav_update_statement2);
 if (success != SQLITE_DONE) {
 
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 
 } else {
 
 }
 sqlite3_reset(fav_update_statement2);
 sqlite3_close(database);
 
 }
 
 return YES;
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 
 }
 
 
 
 - (BOOL) fnRemoveTamilBookMark:(NSString*)pstrTamilQuoteIdFav {
 
 
 @try {
 
 DataBaseConnection *oDBCon = [[DataBaseConnection alloc] init];
 
 if (sqlite3_open([[oDBCon fnGetDBPath] UTF8String], &database) == SQLITE_OK) {
 
 NSString *updateSql = [NSString stringWithFormat: @"UPDATE tbl_Quotes SET Bookmarks='0' WHERE id='%@'",pstrTamilQuoteIdFav];
 const char *sql = [updateSql UTF8String];
 //const char *sql = "UPDATE tbldetails SET loginstatus=1,userid=? WHERE id=1";
 if (sqlite3_prepare_v2(database, sql, -1, &fav_update_statement2, NULL) != SQLITE_OK) {
 NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
 }
 
 
 int success = sqlite3_step(fav_update_statement2);
 if (success != SQLITE_DONE) {
 
 NSAssert1(0, @"Error: failed to save priority with message '%s'.", sqlite3_errmsg(database));
 
 } else {
 
 }
 sqlite3_reset(fav_update_statement2);
 sqlite3_close(database);
 
 }
 return YES;
 }
 @catch (NSException *exception) {
 NSLog(@"Exception in Db %@",exception);
 }
 @finally {
 
 }
 
 }

 
 
 */



- (id)initWithPrimaryKey:(NSInteger)pk database:(sqlite3 *)db {
    database=db;
    primaryKey = pk;
    return self;
}

@end
