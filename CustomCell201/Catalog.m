//
//  Catalog.m
//  CustomCell201
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Catalog.h"
#import "Product.h"

@implementation Catalog
{
    NSArray *data;
}

static Catalog *_instance = nil;
+(id)defaultCatalog{
    if(nil == _instance)
        _instance = [[Catalog alloc]init];
    return _instance;
}

-(id)init{
    self = [super init];
    if(self){
        data = @[[Product product:@"BaseBall" code:@"1" price:@"100" image:@"baseball.png"url:@"m.endic.naver.com/krenEntry.nhn?entryId=cf86f8d856724383adcc8877fb10b2dd"],
                 [Product product:@"BasketBall" code:@"2" price:@"150" image:@"basketball.png" url:@"m.endic.naver.com/krenEntry.nhn?entryId=909ea29f86ae4d988e39effa0807dcb6"],
                 [Product product:@"Brazuca" code:@"3" price:@"200" image:@"football.jpg" url:@"m.endic.naver.com/enkrEntry.nhn?entryId=610038a6065b4b208e165c4e2e4adb46"],
                 [Product product:@"RugbyBall" code:@"4" price:@"250" image:@"rugbyball.png" url:@"m.endic.naver.com/krenEntry.nhn?entryId=f56f4d611a1d4651943e14bc2ede6253"],
                 [Product product:@"SoccerBall" code:@"5" price:@"300" image:@"soccerball.png" url:@"m.endic.naver.com/krenEntry.nhn?entryId=ad89fdebbc5044d7980c85666fdfe4f5"]];
                 
        
        
    }
    return self;
}

-(id)productAt:(int)index{
    return [data objectAtIndex:index];

}

-(int)numberOfProduct{
    return (int)[data count];
}

-(Product *)productWithCode:(NSString*)productCode{
   
    for(Product *one in data)
    {
        if([one isEqualProduct:productCode])
            
        {
            return one;
        }
    }
    return nil;
}

@end
