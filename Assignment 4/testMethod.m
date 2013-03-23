- (void) testAddition 
{
STAssertTrue([email validateEmail:@"hello_world@example.com"], @"This is not a valide email");
STAssertTrue([email validateEmail:@"	hellowworld@example.com"], @"This is not a valide email");
STAssertTrue([email validateEmail:@"user001@example.com"], @"This is not a valide email");
}

-(BOOL) validateEmail:(NSString *)email
{
	//this method is used to valide email
	//Return YES or NO
}