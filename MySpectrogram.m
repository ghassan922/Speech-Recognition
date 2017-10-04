function MySpectrogram= MySpectrogram(sound,frame_size,overlap,window)
framed_mat = framming_data(sound,frame_size,overlap,window);
[x y] = size(framed_mat)
fft_mat = zeros (x,y) ;


    fft_mat = fft(framed_mat);
y = ceil(y/2)
half_mat = zeros(x,y);
for i = 1 : x
half_mat= fft_mat()
end
half_mat = log(abs(half_mat)+1);