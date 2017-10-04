function aut_corr(framematrix,persentag)
enrg=energy(framematrix);
[r c]=size(framematrix)
m=max(enrg);
index=0;
for i=1:length(enrg)
    if(enrg(i)==m)
        index=i;
    end
end
index

    
v=framematrix(index,:);

x=xcorr(v,v);
d=length(x);
c=ceil(d/2);
auto_fram=x(1,c:end);
ma=max(auto_fram)
%plot(auto_fram);
cliping_autof=[];
clipping_rate=persentag/100*ma;
for i=1 :length(auto_fram)
    if abs(auto_fram(i))>clipping_rate
        if auto_fram(i)>0
            cliping_autof(i)=auto_fram(i)-clipping_rate;
        else
            cliping_autof(i)=auto_fram(i)+clipping_rate;
        end
    else
        cliping_autof(i)=0;
        
    end
end
        


figure,subplot(1,2,1);
plot(auto_fram);
subplot(1,2,2);
plot(cliping_autof);



end

