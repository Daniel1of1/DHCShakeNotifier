//
//  ViewController.m
//  DHCShakeRecogniser
//
//  Created by confidence on 29/01/2013.
//  Copyright (c) 2013 confidenceJuice. All rights reserved.
//

#import "ViewController.h"

#import "UIWindow+DHCShakeRecognizer.h"


@interface ViewController ()

@property (nonatomic, strong) IBOutlet UILabel *label;

@end

@implementation ViewController

-(void)gotShake{
    _label.text=@"woop got the shake";
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(resetLabel)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //register for the notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotShake) name:DHCSHakeNotificationName object:nil];

    //initial text
    [self resetLabel];
}

-(void)resetLabel{
    _label.text=@"to shake on simulator: ^⌘Z";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DHCSHakeNotificationName object:nil];
}

@end
