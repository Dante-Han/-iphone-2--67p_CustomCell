//
//  CartViewController.m
//  CustomCell201
//
//  Created by 한상민(iPhone) on 2014. 1. 13..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "CartViewController.h"
#import "Cart.h"
#import "CartItem.h"

#import "CartCell.h"
#import "CartDelegate.h"

@interface CartViewController ()<UITableViewDataSource,CartCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak,nonatomic)Cart *cart;

@end

@implementation CartViewController

-(void)incQuantity:(NSString *)productCode
{

    
    [[Cart defaultCart]incQuantity:productCode];
    [_table reloadData];
}

//카트내 상품 수량 감소(델리게이트 메소드)
-(void)decQuantity:(NSString*)productCode
{
    [[Cart defaultCart] decQuantity:productCode];
    [_table reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    Cart *cart=[Cart defaultCart];
    
    
    return cart.items.count;
}


-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
    cell.delegate = self;
    
    CartItem *item = self.cart.items[indexPath.row];

    [cell setCartItem:item];
    return  cell;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.table reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
