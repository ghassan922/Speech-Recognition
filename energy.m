function energy_vector=energy(frame_matrix)
%arr=[1 2 3 7 7 7 7 7;4 5 6 6 6 6 6 6;6 3 5 6 7 8 9 0; 3 4 5 6 7 8 9 0];
energy_vector=[];
powerd_frame_matrix=frame_matrix.^2;
energy_vector=sum(powerd_frame_matrix,2);


end


    