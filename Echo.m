recObj = audiorecorder(44100,8,1);
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');
disp('Original Audio.');

play(recObj);

% stop(p); coder.extrinsic('sound');  sound(u,2000);
s = getaudiodata(recObj);
% plot(s)
pause(5)
disp('After adding Echo.')
% sound(s,44100)
% pause(5)
% disp('next');
Fs=44100;
% delay=1;
% amp=0.8;
% dt = 1/Fs;
%  % Calculate the number of points for the given delay
%  N = round(delay/dt);
%  % Pad the original signal with zeros to make room for the echo
%  s1 = [s; zeros(N, 1)];
%  % Create an echo signal that starts with 0's
%  s2 = [zeros(N, 1); s.*amp];
%  % Add the echo to the original signal
%  output = s1 + s2;
%  % the abs of all values must be < 1. Rescale if necessary
%  if max(abs(output)) > 1
%  output = output./max(abs(output));
%  end
% sound(output);
% figure,plot(output)

num=[1,zeros(1,40000),0.6];
den=(1);

x=filter(num,den,s);

p1=audioplayer(x,Fs);
play(p1)