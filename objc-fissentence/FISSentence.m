//
//  FISSentence.m
//  objc-fissentence
//
//  Created by John Hussain on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence

- (void) assembleSentence{
    
    self.sentence = [self.words componentsJoinedByString:@" "];
    
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
    
    //NSLog(@"\n\n\n***%@***\n\n", self.sentence);
    
}

- (BOOL) validWord: (NSString*) word{
    
    if (word.length > 0 && !([word isEqualToString:@" "]) && !([word isEqualToString:@""])) {
        
        return YES;
    }
    return NO;
}

- (BOOL) validPunctuation: (NSString*) punctuation{
    
    if (punctuation == nil) {
        
        return NO;
    }
    
    if (![@".?!,;:—" containsString:punctuation]) {
    
        return NO;
    }
    
    return YES;
}

- (BOOL) validIndex: (NSUInteger) index{
    
    if (index >= self.words.count) {
        return NO;
    }
    return YES;

}

- (void) addWord:(NSString *)word{
    
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    
    [self assembleSentence];
    
}

- (void) addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    
    if ([words isEqualToArray:@[]] || words == nil) {
        
        return;
    }
    
    if (![self validPunctuation:punctuation]) {
        
        return;
    }

    for (NSString *word in words) {
        
        if ([self validWord:word]) {
        
            [self.words addObject:word];
        }
    }
    
    self.punctuation = punctuation;
    
    [self assembleSentence];
}

- (void) removeWordAtIndex:(NSUInteger)index{
    
    if ([self validIndex:index]) {
        
        [self.words removeObjectAtIndex:index];
    }
    
    [self assembleSentence];

}

- (void) insertWord:(NSString *)word atIndex:(NSUInteger)index{
    
    if ([self validWord:word] && [self validIndex:index]) {
        
        [self.words insertObject:word atIndex:index];
    }
    
    [self assembleSentence];

}

- (void) replacePunctuationWithPunctuation:(NSString *)punctuation{
   
    if ([self validPunctuation:punctuation]) {
        
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];

}

-(void) replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    
    if ([self validIndex:index] && [self validWord:word]) {
        
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    
    [self assembleSentence];
    
}

@end

