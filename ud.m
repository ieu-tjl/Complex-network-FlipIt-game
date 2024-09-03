clc
clear all
M=2;%选择网络  1为无标度网络 2为小世界网络

Ud(20,100)=zeros();
ka=14;

AttCir=ka;
PD=11:15;
for kd=PD
    DefCir=kd;
    [tUa,tUd]=time_network_ud(M,AttCir,DefCir);
    Ud(kd,:)=tUd;
end
Ud_plot=Ud';

figure
p=plot(Ud_plot(:,PD))
xlabel('t')
ylabel('U_{d}')
legend(['P_{D}=',num2str(PD(1))],['P_{D}=',num2str(PD(2))],['P_{D}=',num2str(PD(3))],['P_{D}=',num2str(PD(4))],['P_{D}=',num2str(PD(5))])


%ss=[1 10 20 30 40 50 60 70 80 90 100];
%mpu=Ud(:,ss);
%hold on
%plot(ss,mpu(min(PD),:),'-')
%hold on
%plot(ss,mpu(min(PD)+1,:),'-*')
%hold on
%plot(ss,mpu(min(PD)+2,:),'-o')
%hold on
%plot(ss,mpu(min(PD)+3,:),'-s')
%hold on
%plot(ss,mpu(min(PD)+4,:),'-p')


