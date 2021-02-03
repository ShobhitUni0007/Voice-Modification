recObj = audiorecorder(44100,8,1);
disp('Start speaking.')
recordblocking(recObj,5);
disp('End of Recording.');
disp('Original Audio.');

play(recObj);

old_sig = getaudiodata(recObj);
pause(5)
disp('After Silence Removal')
fs = 22050;
frame_duration = 0.1;
frame_len = frame_duration*fs;
N = length(old_sig);

num_frames = floor(N/frame_len);
new_sig = zeros(N,1);
count = 0;

for k = 1: num_frames
    frame = old_sig( (k-1)*frame_len + 1 : frame_len*k );
    max_val = max(frame);
    if(max_val > 0.05)
        count = count + 1;
        new_sig((count-1)*frame_len + 1 : frame_len*count ) = frame;
    end
end

sound(new_sig,44100);

plot(old_sig);
figure()
plot(new_sig);
