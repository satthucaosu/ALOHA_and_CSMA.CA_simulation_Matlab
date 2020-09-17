close all;
clear all;
%% Pure ALOHA vs Slotted ALOHA
G = 0:0.1:5;
S_slotted = G.*exp(-G);
S_pure = G.*exp(-2*G);

figure 
plot(G,S_slotted,G,S_pure)
xlabel('Offered Load rate G')
ylabel('Throughput')
title('Throughput of Slotted and Pure ALOHA protocol')
legend('Slotted ALOHA', 'Pure ALOHA')


%% Unslotted and Slotted Non-persistent CSMA
a1 = 0.001;
a2 = 0.01;
G = 0:10^-3:10^4;

S1_u = G.*exp(-a1*G)./(G.*(1+2*a1)+exp(-a1*G));
S1_s = G.*(a1*exp(-a1*G))./(1-exp(-a1*G)+a1);
S2_u = G.*exp(-a2*G)./(G.*(1+2*a2)+exp(-a2*G));
S2_s = G.*(a2*exp(-a2*G))./(1-exp(-a2*G)+a2);

figure
semilogx(G,S1_u,G,S1_s,G,S2_u,G,S2_s)
xlabel('Offered Load (G)');
ylabel('Throughput (S)');
title('Comparing throughput-load of slotted and unslotted non-persistent CSMA');
legend('unslotted a=0.001','slotted a=0.001','unslotted a=0.01','slotteda=0.01');

%% Unslotted and Slotted 1-persistent CSMA
a3 = 0.1;
a4 = 1;
G = 0:10^-3:10^1;

S3_u = G.*(1+G+a3*G.*(1+G+a3*G/2)).*exp(-G*(1+2*a3))./(G*(1+2*a3)-(1-exp(-a3*G))+(1+a3*G).*exp(-G*(1+a3)));
S3_s = G.*(1+a3-exp(-a3*G)).*exp(-G*(1+a3))./((1+a3)*(1-exp(-a3*G))+a3*exp(-G*(1+a3)));
S4_u = G.*(1+G+a4*G.*(1+G+a4*G/2)).*exp(-G*(1+2*a4))./(G*(1+2*a4)-(1-exp(-a4*G))+(1+a4*G).*exp(-G*(1+a4)));
S4_s = G.*(1+a4-exp(-a4*G)).*exp(-G*(1+a4))./((1+a4)*(1-exp(-a4*G))+a4*exp(-G*(1+a4)));

figure
semilogx(G,S3_u,G,S3_s,G,S4_u,G,S4_s)
xlabel('Offered Load (G)');
ylabel('Throughput (S)');
title('Comparing throughput-load of Slotted and Unslotted 1-persistent CSMA');
legend('unslotted a=0.1','slotted a=0.1','unslotted a=1','slotteda=1');


%% Comparing between all the protocols 
a = 0.8;
G = 0:10^-3:1000;

S_pure = G.*exp(-2*G);
S_slotted = G.*exp(-G);
S_u0 = G.*exp(-a*G)./(G.*(1+2*a)+exp(-a*G));
S_s0 = G.*(a*exp(-a*G))./(1-exp(-a*G)+a);
S_u1 = G.*(1+G+a*G.*(1+G+a*G/2)).*exp(-G*(1+2*a))./(G*(1+2*a)-(1-exp(-a*G))+(1+a*G).*exp(-G*(1+a)));
S_s1 = G.*(1+a-exp(-a*G)).*exp(-G*(1+a))./((1+a)*(1-exp(-a*G))+a*exp(-G*(1+a)));


figure
semilogx(G,S_pure,G,S_slotted,G,S_u0,G,S_s0,G,S_u1,G,S_s1)
xlabel('Offered Load (G)');
ylabel('Throughput (S)');
title('Throughput for the various access mode (a=0.8)');
legend('Pure ALOHA','slotted ALOHA','unslotted 0-persistent CSMA','slotted 0-persistent CSMA','unslotted 1-persistent CSMA','slotted 1-persistent CSMA');


%% CSMA/CA 
n = 20; 
p = 0:0.1:1;
t = 1-(1-p).^(1/(n-1));
W = 32;
m = 3;
i = 1:m;
A = sum((2*p).^i)
figure 
plot(p,t2)