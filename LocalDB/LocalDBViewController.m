//
//  LocalDBViewController.m
//  LocalDB
//
//  Created by NTL BUSINESS APP on 8/4/14.
//  Copyright (c) 2014 NTL. All rights reserved.
//

#import "LocalDBViewController.h"

@interface LocalDBViewController ()

@end

@implementation LocalDBViewController
@synthesize oDbFiles,pstrName,pstrAge,pstrCity,pstrCommunity,pstrCompany,pstrComplexion,pstrCountry,pstrDosam,pstrDrinking,pstrFamilyStatus,pstrFamilyType,pstrFamilyValue,pstrFood,pstrHeight,pstrHobbies,pstrImagePath,pstrMaritalStatus,pstrMotherTongue,pstrPhysicalStatus,pstrPorutham,pstrQualification,pstrRaasi,pstrReligion,pstrSalary,pstrSmoking,pstrStar,pstrState,pstrUserid,pstrWeight;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    pArrDetails = [[NSMutableArray alloc]init];
    oDBFiles = [[DBFiles alloc]init];

    pArrMessage = [[NSMutableArray alloc]init];

    responseData = [NSMutableData data];
    
    NSString *urlRequest =[NSString stringWithFormat:@"url"];
    NSLog(@"urlRequest is come here %@",urlRequest);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlRequest]];
    [NSURLConnection connectionWithRequest:request delegate:self];

}




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    @try {
        [responseData setLength:0];
    }
    @catch (NSException *exception) {
        NSLog(@"Execption Erro : %@",exception);
    }
    @finally {
        
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

//some sort of error, you can print the error or put in some other handling here, possibly even try again but you will risk an infinite loop then unless you impose some sort of limit
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Clear the activeDownload property to allow later attempts
    responseData = nil;
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:error.description
                                                   delegate:nil
                                          cancelButtonTitle:@"Close"
                                          otherButtonTitles:nil];
	[alert show];
    //[alert release];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
//      pArrMessage = [responseString JSONValue];
        NSMutableDictionary *pDictValue = [responseString JSONValue];
    
        NSLog(@"pdict value is %@",pDictValue);

    NSString *pstrName,*pstrAge,*pstrCity,*pstrCommunity,*pstrCompany,*pstrComplexion,*pstrCountry,*pstrDosam,*pstrDrinking,*pstrFamilyStatus,*pstrFamilyType,*pstrFamilyValue,*pstrFood,*pstrHeight,*pstrHobbies,*pstrImagePath,*pstrMaritalStatus,*pstrMotherTongue,*pstrPhysicalStatus,*pstrPorutham,*pstrQualification,*pstrRaasi,*pstrReligion,*pstrSalary,*pstrSmoking,*pstrStar,*pstrState,*pstrUserid,*pstrWeight;
    LocalDBViewController *oLocalDBViewController = [[LocalDBViewController alloc]init];
    
        oLocalDBViewController.pstrName  = [pDictValue objectForKey:@"Name"];
        oLocalDBViewController.pstrAge  = [pDictValue objectForKey:@"Age"];
        oLocalDBViewController.pstrCity  = [pDictValue objectForKey:@"City"];
    oLocalDBViewController.pstrCommunity  = [pDictValue objectForKey:@"Community"];
    oLocalDBViewController.pstrCompany  = [pDictValue objectForKey:@"Company"];
    oLocalDBViewController.pstrComplexion  = [pDictValue objectForKey:@"Complexion"];
    oLocalDBViewController.pstrCountry  = [pDictValue objectForKey:@"Country"];
    oLocalDBViewController.pstrDosam  = [pDictValue objectForKey:@"Dosam"];
    oLocalDBViewController.pstrDrinking  = [pDictValue objectForKey:@"Drinking"];
    oLocalDBViewController.pstrFamilyStatus  = [pDictValue objectForKey:@"FamilyStatus"];
    oLocalDBViewController.pstrFamilyType  = [pDictValue objectForKey:@"FamilyType"];
    oLocalDBViewController.pstrFamilyValue  = [pDictValue objectForKey:@"FamilyValue"];
    oLocalDBViewController.pstrFood  = [pDictValue objectForKey:@"Food"];
    oLocalDBViewController.pstrHeight  = [pDictValue objectForKey:@"Height"];
    oLocalDBViewController.pstrHobbies  = [pDictValue objectForKey:@"Hobbies"];
    oLocalDBViewController.pstrImagePath  = [pDictValue objectForKey:@"ImagePath"];
    oLocalDBViewController.pstrMaritalStatus  = [pDictValue objectForKey:@"MaritalStatus"];
    oLocalDBViewController.pstrMotherTongue  = [pDictValue objectForKey:@"MotherTongue"];
    oLocalDBViewController.pstrPhysicalStatus  = [pDictValue objectForKey:@"PhysicalStatus"];
    oLocalDBViewController.pstrPorutham  = [pDictValue objectForKey:@"Porutham"];
    oLocalDBViewController.pstrQualification  = [pDictValue objectForKey:@"Qualification"];
    oLocalDBViewController.pstrRaasi  = [pDictValue objectForKey:@"Raasi"];
    oLocalDBViewController.pstrReligion  = [pDictValue objectForKey:@"Religion"];
    oLocalDBViewController.pstrSalary  = [pDictValue objectForKey:@"Salary"];
    oLocalDBViewController.pstrSmoking  = [pDictValue objectForKey:@"Smoking"];
    oLocalDBViewController.pstrStar  = [pDictValue objectForKey:@"Star"];
    oLocalDBViewController.pstrState  = [pDictValue objectForKey:@"State"];
    oLocalDBViewController.pstrUserid  = [pDictValue objectForKey:@"Userid"];
    oLocalDBViewController.pstrWeight  = [pDictValue objectForKey:@"Weight"];

    [pArrMessage addObject:oLocalDBViewController];

        oDbFiles = [[DBFiles alloc] init];
        [oDbFiles fnRegister:pArrMessage];
    
    pArrDetails = [oDBFiles fnGetDetails];
    
    for (int i = 0; i < [pArrDetails count]; i++) {
        oDbFiles = [pArrDetails objectAtIndex:i];
        NSLog(@"odb file s %@",oDbFiles.pstrName);

        
    }
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
