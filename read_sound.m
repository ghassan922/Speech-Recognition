function [frame_matrix]=read_sound(sound,window_size,frame_shift,window_type)
[sound_data,fs]=wavread(sound);
total_size=length(sound_data);

start1=1;

window_size=window_size/1000;
frame_shift=frame_shift/1000;
%window_size=window_size*fs;
%frame_shift=frame_shift*fs;

sound=sound_data;
plot(sound);
ennd=round(start1 + window_size);
ennd 
start1

fs

frame_matrix = [];
show =[];
framelength=[];
lastframe=[];
if window_type==1
    for i=1:total_size
        ennd
        start1

        lastframe=framelength;
        %  wind = rectwin(window_size);
        %start=ennd-frame_shift;
        frame = sound(start1 : ennd);
        framelength=length(frame);
        frame
      if framelength<lastframe
          frame(framelength+1:lastframe)=0;
        framWind = frame .* 1;
        frame_matrix=[frame_matrix;framWind];
      
        start1=round(ennd-frame_shift);
        endd=round(start1 +window_size);
      else
           framWind = frame .* 1;
        frame_matrix=[frame_matrix;framWind];
      
        start1=round(ennd-frame_shift);
        endd=round(start1 +window_size);
      end
    end
    
    
    else if window_type==2
    for i=0:total_size
        arr=[sound_data];
        frame1=hann(window_size)*arr;
        start=ennd-frame_shift;
        arr=arr(start:window_size);
        frame_matrix=[frame_matrix;frame1];
        
        
    end    
         
        else if window_type==3
    for i=0:total_size
        arr=[sound_data];
        frame1=hamming(window_size)*arr;
        start=ennd-frame_shift;
        arr=arr(start:window_size);
        frame_matrix=[frame_matrix;frame1];
       
    end
            end
        
        end 
end
    l=length(frame_matrix);
    for i=1 :l
        v=frame_matrix(i : i+1);
        show=[show v];
    end
plot(show);
plot(sound_data);

end