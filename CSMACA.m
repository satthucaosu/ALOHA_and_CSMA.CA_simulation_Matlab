close all;
clear all; 

%% System parameters 
payload = 8184;             %bits
MAC_header = 272;           %bits
PHY_header = 128;           %bits
ACK_msg = 112 + PHY_header; %bits
RTS_msg = 160 + PHY_header; %bits
CTS_msg = 112 + PHY_header; %bits 
R = 1E6;                   %bit/s, Channel bit rate 
d = 1E-6;                   %s, propagation delay 
sigma = 50E-6 ;             %s, Slot time 
SIFT = 28E-6;               %s
DIFS = 128E-6;              %s
ACK_timeout = 300E-6;       %s
CTS_timeout = 300E-6;       %s

Ep = payload/R;             %s, payload in second 
MAChdr = MAC_header/R;      %s 
PHYhdr = PHY_header/R;      %s
ACK = ACK_msg/R;            %s
RTS = RTS_msg/R;            %s
CTS = CTS_msg/R;            %s

Ts_basic = 8982E-6;         %s
Tc_basic = 8713E-6;         %s
Ts_rts = 9568E-6;           %s
Tc_rts = 417E-6;            %s

%% Throughput 
n = 5;                      %number of stations 
to = 0.0001:0.0001:0.1; %tranmission probability 

figure (1)
for n=[5 10 20 50] 
    Ptr = 1-(1-to).^n;                      %probability that at least one transmission in the considered slot time
    Ps  = n*to.*(1-to).^(n-1)./(1-(1-to).^n);     %prob that a transmission occuring on the channel is successful
    S_basic = Ps.*Ptr*Ep./((1-Ptr)*sigma+Ptr.*Ps*Ts_basic+Ptr.*(1-Ps)*Tc_basic);
    
    plot(to,S_basic);
    hold on
end 
axis([0 0.1 0.4 0.9]);
xlabel('transmission probability $\tau$','Interpreter','latex');
ylabel('throughput');
legend('n=5','n=10','n=20','n=50');
title("Throughput vesus the transmission probability $\tau$ for the basic acess mechanism",'Interpreter','latex');

to = 0.0001:0.001:0.25;
figure (2)
for n=[5 10 20 50] 
    Ptr = 1-(1-to).^n;                      %probability that at least one transmission in the considered slot time
    Ps  = n*to.*(1-to).^(n-1)./(1-(1-to).^n);     %prob that a transmission occuring on the channel is successful
    S_rts = Ps.*Ptr*Ep./((1-Ptr)*sigma+Ptr.*Ps*Ts_rts+Ptr.*(1-Ps)*Tc_rts);
    plot(to,S_rts);
    hold on
end 

axis([0 0.25 0.4 0.9]);
xlabel('transmission probability $\tau$','Interpreter','latex');
ylabel('throughput');
legend('n=5','n=10','n=20','n=50');
title("Throughput vesus the transmission probability $\tau$ for the RTS/CTS acess mechanism",'Interpreter','latex');


%% finding unique solution for \tau and p with predefined CW and m 
m = 3; 
CW = 32; 
i = 1:m; 
p = 0:0.01:1;
P = [];
n = 20;
for k = 1:m
    P = [P;p];
end

tau = 2./(1+CW+CW*p.*sum((2*P).^(i')));

tau2 = 1-(1-p).^(1/(n-1)); 

figure(3)
plot(p,tau, p, tau2)
axis([0 1 0 0.2]);
xlabel('collision probability p');
ylabel('transmission probability $\tau$','Interpreter','latex');
title('Unique solution for p and $\tau$ with CW=32 and m=3','Interpreter','latex');



%% Throughput depend on the number of station
CW = 32;
m = 3;
tau = [];
n = 5:5:50;
for i = 5:5:50
    [~,t] = tandp(CW,m,i);
    tau = [tau t];
end 

Ptr = 1-(1-tau).^n;   
Ps  = n.*tau.*(1-tau).^(n-1)./(1-(1-tau).^n); 

S_basic = Ps.*Ptr*Ep./((1-Ptr)*sigma+Ptr.*Ps*Ts_basic+Ptr.*(1-Ps)*Tc_basic);
S_rts = Ps.*Ptr*Ep./((1-Ptr)*sigma+Ptr.*Ps*Ts_rts+Ptr.*(1-Ps)*Tc_rts);

figure (4)
plot(n,S_basic,'-o',n,S_rts,'-*');
axis([0 50 0.5 0.9])
xlabel('Number of stations');
ylabel('Saturation throughput');
title('Saturation throughput versus number of station with CW=32 and m =3');
legend('basic access mechanism','RTS/CTS access mechanism');





