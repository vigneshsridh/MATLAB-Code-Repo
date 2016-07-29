
function w=d2b(x)
q=zeros(1,8);
q(1)=x;
w=zeros(1,8);
for i=1:8
    if q(i)~=0
    q(i+1)=floor(q(i)/2);
    rem=mod(q(i),2);
    w(9-i)=rem;
    else 
        break;
    end
end


