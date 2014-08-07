//
//  DBFiles.h
//  SixGroups
//
//  Created by sixcroresapp on 1/16/14.
//  Copyright (c) 2014 SixGroups. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBFiles : NSObject {
    
    NSString *pStrLoginStatus,*pUserId,*pCustomerID,*pStrId;
    int iFavourite;
    sqlite3 *database;
    NSInteger primaryKey;
    DBFiles *oDBFiles;
    NSMutableArray *pArrDetails;
}
@property(nonatomic,retain)NSMutableArray *pArrMessage;
@property(nonatomic)NSInteger primaryKey;
@property(nonatomic) int iFavourite;
@property(nonatomic,retain) NSString *pStrLoginStatus,*pUserId,*pCustomerID;
@property (strong,retain) NSString *pstrName,*pstrAge,*pstrCity,*pstrCommunity,*pstrCompany,*pstrComplexion,*pstrCountry,*pstrDosam,*pstrDrinking,*pstrFamilyStatus,*pstrFamilyType,*pstrFamilyValue,*pstrFood,*pstrHeight,*pstrHobbies,*pstrImagePath,*pstrMaritalStatus,*pstrMotherTongue,*pstrPhysicalStatus,*pstrPorutham,*pstrQualification,*pstrRaasi,*pstrReligion,*pstrSalary,*pstrSmoking,*pstrStar,*pstrState,*pstrUserid,*pstrWeight;
- (id)initWithPrimaryKey:(NSInteger)pk database:(sqlite3 *)db;
- (BOOL)fnRegister:(NSMutableArray *)pArrMessage;
- (NSMutableArray *)fnGetDetails;


@end
