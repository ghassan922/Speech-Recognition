function new_d(file,label)
[x fs ]= wavread(file);
t=0.015*fs;
Nx = length(x);
t2=0.05*fs;

nsc = floor(Nx/t);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));



nsc1 = floor(Nx/t2);
nov1 = floor(nsc1/2);
nff1 = max(256,2^nextpow2(nsc1));
if(label == 1)
spectrogram(x,hamming(nsc),nov,nff);
title('WideBand');
elseif(label==2)
spectrogram(x,hamming(nsc1),nov1,nff1);
title('NarrowBand');
end

end
