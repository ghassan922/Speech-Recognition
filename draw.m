function draw()
[s,fs]=wavread('speech.wav');
T=0.05;

%to make the computation efficient thats why we take in powers of 2 
N=2^round(log2(T*fs));  
%defining the hamming window
win=hamming(N);
subplot(2,1,1);specgram(s,N,fs,win,floor(0.50*N));
title('narrowband');
subplot(2,1,2);
title('wideband');specgram(s,N,fs,hamming(N/4),round(0.50*N/4));



end