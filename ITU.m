function itu=ITU(energy_vect)
%% this function return the energy thresholds
IMn=min(energy_vect)
IMx=max(energy_vect)
I1=0.3*(IMx-IMn)+IMn
I2=4+IMn

ITL=min(I1,I2)
itu=3*ITL
end
