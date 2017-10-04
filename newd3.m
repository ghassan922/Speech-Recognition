function newd3()
[y Fs]=wavread('speech2.wav');
t_window_narrowband = 0.05;		% window - time
t_overlap_narrowband = 0.001;
window_narrowband = t_window_narrowband*Fs;	% window samps
noverlap_narrowband = 0.5*window_narrowband;%t_overlap_narrowband*Fs;
nfft_narrowband = 1024;

window = window_narrowband;
noverlap = noverlap_narrowband;
nfft = nfft_narrowband;

subplot(2,1,1);
specgram(y,nfft,Fs,window,floor(noverlap));
%xlabel('Time (sec)','fontsize',fontsize);
%ylabel('Frequency (Hz)','fontsize',fontsize);
end
