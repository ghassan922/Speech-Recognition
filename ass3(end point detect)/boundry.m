function boundry(sound,frame_size,frame_overlap)
%%this function detect the silance in speech signal and remove the silance 
[speech_signal,fs]=wavread(sound);
frame_shift=frame_size-frame_overlap;
frame_shift=ceil(frame_shift*fs/1000);

%%
%take a sound and calculat the energy an zero crosing for it
fram=framming_data(sound,frame_size,frame_overlap,1);
en=energy(fram);
zc=zero_crosing(fram);

%%
% calculate the energy and zero_crosing thresholds
itu=ITU(en);
zcrt=zrc_trish(sound,frame_size,frame_overlap,zc);
l_zc=length(zc)
l_en=length(en)

%%
%detect the new start and new end with out the silance
% 1:from the energy
for i=1:l_en
    if(itu<en(i))
        n1=i;
        break;
    end
end
for j=l_en:-1 :1
        if(itu<en(j))
            n2=j;
            break;
        end
        
      
end

%%
% 2:from the zero crosing
new_n1=n1-5;
if(n2+5<l_en)
    new_n2=n2+5;
else
    new_n2=n2;
end
for i=new_n1 :n1
    if(zc(i)<zcrt)
        new_n1=i;
        break;
    end
end
for j=l_zc:new_n2
    if(zc(j)<zcrt)
        new_n2=j;
        break;
    end
end
%%
%return the new valeus for start and end 
n1
n2
new_n1
new_n2
%%
%from frame number to time
     new_n1= new_n1*frame_shift
    
    new_n2= new_n2*frame_shift
%%
%plot the oreginal signal and the modefied signal
subplot(2,1,1) ;plot(speech_signal)
title('speech signal')

new_v=[];
new_v=speech_signal(new_n1 :new_n2);
subplot(2,1,2) ;plot(new_v)
title('un silent signal')

end

        
