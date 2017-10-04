function izcrs=zrc_trish(sound,frame_size,frame_overlap,zc_v)
%% this function calculat the zero crosing thresholds

[sound_data,fs]=wavread(sound);
frame_shift=frame_size-frame_overlap;
frame_shift=(fs*frame_shift)/1000;

%%
%for first 100 sampls and last 100 sampls and convert this indexies to
%frame
sp=100*fs/1000;
indx=ceil(sp/frame_shift);
siz_v=length(zc_v);
last=siz_v-100;
%%
% convert zc_vector from colum vector to an row vector and corp the fist100
% and last100 sampels  to new vector then calculate the mean and sdfor it 
zc_v=zc_v';
crop_zc=[zc_v(1:indx),zc_v(last:end)];
mean_crop_zc=mean(crop_zc);
stdv_crop_zc=std(crop_zc);
avg_zc=mean(zc_v);
%%%%%%%%%%%%%%%%%%%
v=(0.5*(avg_zc/mean_crop_zc))+(0.5*(1+(stdv_crop_zc/mean_crop_zc)));
izcrs=mean_crop_zc + stdv_crop_zc * v ;
end
