//
//  LocalDBViewController.h
//  LocalDB
//
//  Created by NTL BUSINESS APP on 8/4/14.
//  Copyright (c) 2014 NTL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"

@interface LocalDBViewController : UIViewController {
    NSMutableData *responseData;
    NSURL *url;
    DBFiles *oDBFiles;
    NSMutableArray *pArrMessage,*pArrDetails;

}
@property (nonatomic,strong) DBFiles *oDbFiles;
@property (strong,retain) NSString *pstrName,*pstrAge,*pstrCity,*pstrCommunity,*pstrCompany,*pstrComplexion,*pstrCountry,*pstrDosam,*pstrDrinking,*pstrFamilyStatus,*pstrFamilyType,*pstrFamilyValue,*pstrFood,*pstrHeight,*pstrHobbies,*pstrImagePath,*pstrMaritalStatus,*pstrMotherTongue,*pstrPhysicalStatus,*pstrPorutham,*pstrQualification,*pstrRaasi,*pstrReligion,*pstrSalary,*pstrSmoking,*pstrStar,*pstrState,*pstrUserid,*pstrWeight;

@end
