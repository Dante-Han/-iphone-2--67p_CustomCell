//
//  ProductDetailViewController.m
//  CustomCell201
//
//  Created by 한상민(iPhone) on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "Catalog.h"
#import "Product.h"


@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDetail;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    //카탈로그에서 제품 정보를 얻어온다.
    Catalog *catalog = [Catalog defaultCatalog];
    Product *product = [catalog productWithCode:self.productCode];
    
    
    self.urlStr = product.url;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",self.urlStr]];


    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    self.imageViewDetail.image=[UIImage imageNamed:product.imageName];
                                self.name.text = product.name;
                                self.price.text = product.price;
    
    
                                self.title = product.name;
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
