//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Abraham Koshy on 12/24/13.
//  Copyright (c) 2013 Ubikwity. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) Deck* deck;
@end

@implementation CardGameViewController

-(void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        UIImage *cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    } else {
        Card* card = [self.deck drawRandomCard];
        if (card) {
            UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}

-(Deck*)deck {
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}


@end
