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