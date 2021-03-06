function [frames_mat] = Reader(speech,frame_size,frame_shift,window)
[values,fs] = wavread(speech);
size1 = length(values);
frame_start = 0 ;
frame_end = frame_size - frame_shift ;
signal = values ;

if window ==1
 for i=0 : size1
     signal = signal(frame_start:size1);
     frame = rectwin(frame_size)*signal;
     frame_start = frame_start + frame_end ;
     frame_end = (frame_start+frame_size) ;
     
     frames_mat = [frames_mat;frame];
 end
end

 plot(signal);
 plot(frames_mat);
 