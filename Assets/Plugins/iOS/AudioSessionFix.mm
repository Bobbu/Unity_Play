#import <AVFoundation/AVFoundation.h>

extern "C" void _SetAudioSessionPlayback() {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
}
