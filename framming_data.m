function frame_matrix=framming(sound,frame_size,frame_overlap,window_type)

[sound_data,fs]=wavread(sound);
signal_size=length(sound_data);



frame_size=frame_size/1000;
frame_size=round(frame_size*fs)
frame_overlap=frame_overlap/1000;
frame_overlap=round(frame_overlap*fs);

num_of_frame=ceil(signal_size/frame_size)

frame_start=1;
frame_end =frame_size;

f=sound_data(frame_start:frame_end);
l=length(f);
%frame_matrix=zeros(num_of_frame,l);
frame_matrix=[];
for i=1:num_of_frame
    if (frame_end >signal_size)
        frame_end=signal_size;
    end
    frame=sound_data(frame_start:frame_end);
    [frame_window]=frame.*1;
    frame_window=frame_window';
    length_frame=length(frame_window);
    
    if (length_frame ==l)
        

        frame_matrix=[frame_matrix;frame_window];
    else
        frame_window(length_frame+1:l)=0;
        frame_matrix=[frame_matrix;frame_window];
    end
    frame_start=ceil(frame_end-frame_overlap);
    frame_end=ceil(frame_start+frame_size-1);
    signal_size;
end
num_of_frame
size(frame_window);
figure,plot(sound_data)
title('frame_matrix')
[r c]=size(frame_matrix);
for i=1 :r
    if (i==1)
        vect=frame_matrix(i,:);
    end
    
    vec=frame_matrix(i,:);
    vect=[vect,vec];
end
vect;
figure,plot(vect);

    
    






end

       
        
    
