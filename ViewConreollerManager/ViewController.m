//
//  ViewController.m
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/3/22.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+JAppViewController.h"

#import "FirstVC.h"

#import "SecondVC.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)onViewControllerResultFrombingData:(id)data toResultCode:(int)resultCode{
    

    
}

- (IBAction)push:(id)sender {
    FirstVC *first = [[FirstVC alloc] init];
    JAppContext *jAppContext0 = [[JAppContext alloc] initWithContextName:@"japp0"];
    jAppContext0.updateIfNeed = YES;
    [jAppContext0 registerCallback:^(id  _Nonnull object, id  _Nullable oldvalue, id  _Nullable newValue) {
        
        NSLog(@"objct ---%@---old--%@--new--%@",object,oldvalue,newValue);
        
        
    } forKey:@"japp0" withObject:self];
    
    [jAppContext0 setObject:@"FirstVC" forKey:@"FirstVC"];
   
//[self.navigationController pushViewController:first animated:YES];
    [self startViewController:first startMode:JAppStartViewControllerModePush bindData:jAppContext0];
}
- (IBAction)present:(id)sender {
    FirstVC *first = [[FirstVC alloc] init];
    JAppContext *jAppContext0 = [[JAppContext alloc] initWithContextName:@"japp0"];
    jAppContext0.updateIfNeed = YES;
    [jAppContext0 registerCallback:^(id  _Nonnull object, id  _Nullable oldvalue, id  _Nullable newValue) {
        
        NSLog(@"objct ---%@---old--%@--new--%@",object,oldvalue,newValue);
        
        
    } forKey:@"japp0" withObject:self];
    
    [jAppContext0 setObject:@"FirstVC" forKey:@"FirstVC"];
    
    //[self.navigationController pushViewController:first animated:YES];
    [self startViewController:first startMode:JAppStartViewControllerModePresent bindData:jAppContext0];

}


@end
