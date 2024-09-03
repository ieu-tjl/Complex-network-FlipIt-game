function [Ua,Ud]=payoff(T,N,AttCir,DefCir,S,I,R,etaSI,etaIR,beta,gamma,theta)
ka=1;  kd=1;
va=1;  ca=0.01;
vd=1;  cd=0.01;

for t=1:length(T)
    for i=1:N
        ra(i,t)=ka*(etaSI(t)*beta(i,t)*S(i,t)*theta(i,t)-etaIR(t)*gamma(i,t)*I(i,t));
        rd(i,t)=kd*(etaIR(t)*gamma(i,t)*I(i,t));
    end
end
Ra(length(T))=zeros();
Rd(length(T))=zeros();
for t=1:length(T)
    for i=1:N
        Ra(t)=Ra(t)+ra(i,t);
        Rd(t)=Rd(t)+rd(i,t);
    end
end
for t=1:length(T)
    na(t)=floor(t/AttCir);
    nd(t)=floor(t/DefCir);
end

Ca=va*ca*na*N;
Cd=vd*cd*nd*N;

for t=1:length(T)-1
    Ra(t+1)=Ra(t)+Ra(t+1);
    Rd(t+1)=Rd(t)+Rd(t+1);
end


Ua=Ra-Ca;
Ud=Rd-Cd;



end