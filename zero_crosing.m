function total=zero_crosing(fram_matrix)
%arr=[1 -2 3 -2;4 3 5 -1];
[r c]=size(fram_matrix);
ans=0;
total=[];
for i=1 :r
    for j=1 :c
        if(j<c)
        if(fram_matrix(i,j)*fram_matrix(i,j+1)<0)
        ans=ans+1;
         
        end
       
            
      
        end
    end
    
     total=[total;ans];
     ans=0;
    
end

end