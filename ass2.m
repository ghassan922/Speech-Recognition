function ass2(sound,frame_size,frame_overlap,window_type)
[speech_signal,fs]=wavread(sound);
matrix=[];
matrix=framming_data(sound,frame_size,frame_overlap,window_type);

energy_vect=energy(matrix)

zero_crosing_vector=zero_crosing(matrix);

subplot(3,1,1) ;plot(speech_signal)
title('speech_signal')
subplot(3,1,2) ;plot(energy_vect)
title('energy_vector')
subplot(3,1,3) ;plot(zero_crosing_vector)
title('zero_crosing_vector')
end