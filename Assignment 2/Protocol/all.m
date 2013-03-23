#import <Foundation/NSObject.h>
#import "AddressBookDelegate.h"

@interface AddressBook: NSObject <AddressBookDelegate> 

@property (nonatomic, retain) NSInteger rows;
@property (nonatomic, retain) NSString title;

@end

/******************************************************************************/

#import <Foundation/NSObject.h>
#import "AddressBookDelegate.h"

@implementation AddressBook

@synthesize rows;
@synthesize title;

- (void) displayName:(NSData) data
{
	
}
- (void) displayPhoneNumber:(NSData) data
{
    
}
- (void) displayAddress:(NSData) data
{

}
- (void) displayFax:(NSData) data
{

}
- (void) displayEmail:(NSData) data
{

}


@end
/******************************************************************************/

#import <Foundation/Foundation.h>

@protocol AddressBookDelegate <NSObject>

@required

- (void) displayName;
- (void) displayPhoneNumber;
- (void) displayAddress;
- (void) displayFax;
- (void) displayEmail;

@optional

- (void) displayDOB; //date of birth
- (void) displayNickName;
- (vodi) displayInstanceMessage;

@end

/******************************************************************************/

#import <Foundation/Foundation.h>
#import "AddressBook.h"

int main( int argc, const char *argv[] ) 
{
	
    // create a new instance
	AddressBook *book = [[AddressBook alloc] init];
	
	[book displayName];
	[book displayPhoneNumber];
	[book displayAddress];
	[book displayFax];   
    
    [book release];
    return 0;
        
}
