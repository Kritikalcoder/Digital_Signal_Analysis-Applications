[y,Fs] = audioread('flute.wav');
%sound(y,Fs);
Fs
%test1 = downsample(y,2);
test1 = resample(y,24000,22050);
sound(test1,Fs);
%test2 = downsample(y,4);
test2 = resample(y,16000,22050);
sound(test2,Fs);
%test3 = downsample(y,8);
test3 = resample(y,8000,22050);
sound(test3,Fs);
%test4 = downsample(y,16);
test4 = resample(y,4000,22050);
sound(test4,Fs);

%-----------------------------------------------------

[y2,Fs2] = audioread('test_audio_file.wav');
sound(y2,Fs2);
Fs
%stest1 = downsample(y2,2);
stest1 = resample(y,24000,22050);
sound(stest1,Fs);
%stest2 = downsample(y2,4);
stest2 = resample(y,16000,22050);
sound(stest2,Fs);
%stest3 = downsample(y2,8);
stest3 = resample(y,8000,22050);
sound(stest3,Fs);
%stest4 = downsample(y2,16);
stest4 = resample(y,4000,22050);
sound(stest4,Fs);

%----------------------------------------------------

load handel.mat
filename = 'handel.wav';
audiowrite(filename,y3,Fs);
clear y Fs;
[y3,Fs] = audioread(filename);
sound(y3,Fs);
Fs
htest1 = downsample(y3,2);
sound(htest1,Fs);
htest2 = downsample(y3,4);
sound(htest2,Fs);
htest3 = downsample(y3,8);
sound(htest3,Fs);

%----------------------------------------------------

[i1,F1] = audioread('impulse_recording.wav');
[i2,F2] = audioread('impulse_small_room.wav');
[i3,F3] = audioread('impulse_concert_hall.wav');

voice1 = convn(y2(:,1),i1(:,1));
voice2 = convn(y2(:,1),i2(:,1));
voice3 = convn(y2(:,1),i3(:,1));

sound(voice1,Fs2);
sound(voice2,Fs2);
sound(voice3,Fs3);