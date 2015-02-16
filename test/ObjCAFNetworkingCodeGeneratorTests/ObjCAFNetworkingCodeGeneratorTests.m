//
//  ObjCAFNetworkingCodeGeneratorTests.m
//  ObjCAFNetworkingCodeGeneratorTests
//
//  Created by Micha Mazaheri on 2/16/15.
//  Copyright (c) 2015 Quentin Rousseau. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "AFNetworking.h"
#import "AFNetworkActivityLogger.h"

@interface ObjCAFNetworkingCodeGeneratorTests : XCTestCase

@end

@implementation ObjCAFNetworkingCodeGeneratorTests

- (void)testGETRequest
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"request sent"];
    
    // GET (Headers & URL Params) (GET http://httpbin.org/get)
	
	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	// Create request
	NSDictionary* URLParams = @{
		@"param1": @"value1",
		@"param2": @"value2",
	};
	NSMutableURLRequest* request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:@"http://httpbin.org/get" parameters:URLParams error:nil];
	// Add Headers
	[request setValue:@"231XLTFRVeael7buM056MvAhhWp0g8lA" forHTTPHeaderField:@"X-Special-Header"];
	[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
	
	// Fetch Request
	AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
		NSLog(@"Response HTTP Response Body: %@", responseObject);
        
        XCTAssertEqual([operation.response statusCode], 200);
        [expectation fulfill];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"HTTP Request failed: %@", error);
        
        XCTAssertTrue(NO);
        [expectation fulfill];
	}];
	
	[manager.operationQueue addOperation:operation];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testPOSTJSONRequest
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"request sent"];
    
	// POST JSON Body (POST http://httpbin.org/post)
	
	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	// JSON Body
	NSDictionary* bodyObject = @{
		@"asdfasf": @42.1123,
		@"asdf": @"asdf",
		@"sadffasdasdfsadf": @YES,
		@"asdfasd": [NSNull null],
		@"asdfasdfasdf": @"ssadfasdfsdf",
		@"asdfasdasd": @[
			@"asdf",
			@"asdfasdf"
		],
		@"sadfasdf": @"asdfsasadfasdfdf",
		@"sdfasdf": @NO
	};
	NSMutableURLRequest* request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:@"http://httpbin.org/post" parameters:bodyObject error:nil];
	
	// Add Headers
	[request setValue:@"sdfsadf" forHTTPHeaderField:@"X-Special-Header"];
	
	// Fetch Request
	AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
		NSLog(@"Response HTTP Response Body: %@", responseObject);
        
        XCTAssertEqual([operation.response statusCode], 200);
        [expectation fulfill];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"HTTP Request failed: %@", error);
        
        XCTAssertTrue(NO);
        [expectation fulfill];
	}];
	
	[manager.operationQueue addOperation:operation];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testPOSTTextRequest
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"request sent"];
    
    // POST Text Body (POST http://httpbin.org/post)

	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	// Body
	NSURL* URL = [NSURL URLWithString:@"http://httpbin.org/post?param=param"];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:[@"Some text body" dataUsingEncoding:NSUTF8StringEncoding]];
	[request setValue: @"" forHTTPHeaderField:@"Content-Type"];

	// Fetch Request
	AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
		NSLog(@"HTTP Response Body: %@", responseObject);
            
		XCTAssertEqual([operation.response statusCode], 200);
		[expectation fulfill];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"HTTP Request failed: %@", error);
        
        XCTAssertTrue(NO);
        [expectation fulfill];
	}];

	[manager.operationQueue addOperation:operation];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testPOSTLongTextRequest
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"request sent"];
    
	// PUT Long Text Body (PUT http://httpbin.org/put)
	
	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	// Body
	NSURL* URL = [NSURL URLWithString:@"http://httpbin.org/put"];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
	[request setHTTPMethod:@"PUT"];
	[request setHTTPBody:[@"Set your own body data" dataUsingEncoding:NSUTF8StringEncoding]];
	[request setValue: @"" forHTTPHeaderField:@"Content-Type"];
						  
	// Fetch Request
	AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
		NSLog(@"Response HTTP Response Body: %@", responseObject);
        
        XCTAssertEqual([operation.response statusCode], 200);
        [expectation fulfill];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"HTTP Request failed: %@", error);
        
        XCTAssertTrue(NO);
        [expectation fulfill];
	}];
						  
	[manager.operationQueue addOperation:operation];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testPOSTFormEncodedURLRequest
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"request sent"];
    
	// POST Form URL-Encoded (POST http://httpbin.org/post)
	
	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	// Form URL-Encoded Body
	NSDictionary* bodyParameters = @{
		@"form-nonce-key": @"h68i6KbuPEAvDwTaMQ2OFpU4lrRwNFs7",
		@"form-date-key": @"Sat, 14 Feb 2015 23:30:17 GMT",
		@"form-key1": @"form-value1",
		@"form-key2": @"form-value2",
    };
	NSMutableURLRequest* request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:@"http://httpbin.org/post" parameters:bodyParameters error:nil];
	
	// Fetch Request
	AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
		NSLog(@"Response HTTP Response Body: %@", responseObject);
        
        XCTAssertEqual([operation.response statusCode], 200);
        [expectation fulfill];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"HTTP Request failed: %@", error);
        
        XCTAssertTrue(NO);
        [expectation fulfill];
	}];
	
	[manager.operationQueue addOperation:operation];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)testPOSTMultipartRequest
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"request sent"];
    
	// POST Multipart (POST http://httpbin.org/post)
	
	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	// Form Multipart Body
	NSDictionary* bodyParameters = @{
		@"multipart-key2": @"multipart-value2",
		@"multipart-key1": @"multipart-value1",
		@"multipart-date-key": @"Sat, 14 Feb 2015 23:44:40 GMT",
		@"multipart-nonce-key": @"bPcB0kgyAvII63JgLesWnSByuHSe511X",
    };
	NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://httpbin.org/post" parameters:bodyParameters constructingBodyWithBlock:nil error:nil];
	
	// Fetch Request
	AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
		NSLog(@"Response HTTP Response Body: %@", responseObject);
                                                                             
        XCTAssertEqual([operation.response statusCode], 200);
        [expectation fulfill];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"HTTP Request failed: %@", error);
        
        XCTAssertTrue(NO);
        [expectation fulfill];
	}];
	
	[manager.operationQueue addOperation:operation];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

@end
