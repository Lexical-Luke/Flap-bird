//
//  Game.h
//  Flap bird
//
//  Created by Luke Wilkinson on 2014/07/10.
//  Copyright (c) 2014 OddDog. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopGreenPosition;
int RandomBottomGreenPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *Startgame;
    IBOutlet UIImageView *GreenTop;
    IBOutlet UIImageView *GreenBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UIButton *Menu;
    IBOutlet UILabel *ScoreLabel;
    
    
    NSTimer *BirdMovement;
    NSTimer *GreenMovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)GreenMoving;
-(void)PlaceGreen;
-(void)Score;
-(void)GameOver;

@end
