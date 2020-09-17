close all;
clear all;

%% Unslotted 0-persistent CSMA

a0 = 0;
a1 = 0.001;
a2 = 0.01;
a3 = 0.1;
a4 = 1;
G = 0:10^-3:1000;
S0 = G.*exp(-a0*G)./(G.*(1+2*a0)+exp(-a0*G));
S1 = G.*exp(-a1*G)./(G.*(1+2*a1)+exp(-a1*G));
S2 = G.*exp(-a2*G)./(G.*(1+2*a2)+exp(-a2*G));
S3 = G.*exp(-a3*G)./(G.*(1+2*a3)+exp(-a3*G));
S4 = G.*exp(-a4*G)./(G.*(1+2*a4)+exp(-a4*G));

figure
semilogx(G,S0,G,S1,G,S2,G,S3,G,S4)
xlabel('Offered Load (G)');
ylabel('Throughput (S)');
title('Throughput-Load of Unslotted Non-persistent CSMA');
legend('a = 0','a=0.001','a=0.01','a=0.1','a=1');
%% Slotted 0-persistent CSMA
a0 = 0;
a1 = 0.001;
a2 = 0.01;
a3 = 0.1;
a4 = 1;
G = 0:10^-3:1000;
S0 = G.*(a0*exp(-a0*G))./(1-exp(-a0*G)+a0);
S1 = G.*(a1*exp(-a1*G))./(1-exp(-a1*G)+a1);
S2 = G.*(a2*exp(-a2*G))./(1-exp(-a2*G)+a2);
S3 = G.*(a3*exp(-a3*G))./(1-exp(-a3*G)+a3);
S4 = G.*(a4*exp(-a4*G))./(1-exp(-a4*G)+a4);

figure
semilogx(G,S0,G,S1,G,S2,G,S3,G,S4)
xlabel('Offered Load (G)');
ylabel('Throughput (S)');
title('Throughput-Load of Slotted Non-persistent CSMA');
legend('a = 0','a=0.001','a=0.01','a=0.1','a=1');


%% Unslotted 1-persistent CSMA
a0 = 0;
a3 = 0.1;
a4 = 1;
G = 0:10^-2:100;
S0 = G.*exp(-G).*(1+G)./(G+exp(-G));
S3 = G.*(1+G+a3*G.*(1+G+a3*G/2)).*exp(-G*(1+2*a3))./(G*(1+2*a3)-(1-exp(-a3*G))+(1+a3*G).*exp(-G*(1+a3)));
S4 = G.*(1+G+a4*G.*(1+G+a4*G/2)).*exp(-G*(1+2*a4))./(G*(1+2*a4)-(1-exp(-a4*G))+(1+a4*G).*exp(-G*(1+a4)));


figure
semilogx(G,S0,G,S3,G,S4)
xlabel('Offered Load (G)');
ylabel('Throughput (S)');
title('Throughput-Load of Unslotted 1-persistent CSMA');
legend('a = 0','a=0.1','a=1');

%% Slotted 1-persistent CSMA
a0 = 0;
a3 = 0.1;
a4 = 1;
G = 0:10^-2:100;
S0 = G.*exp(-G).*(1+G)./(G+exp(-G));
S3 = G.*(1+a3-exp(-a3*G)).*exp(-G*(1+a3))./((1+a3)*(1-exp(-a3*G))+a3*exp(-G*(1+a3)));
S4 = G.*(1+a4-exp(-a4*G)).*exp(-G*(1+a4))./((1+a4)*(1-exp(-a4*G))+a4*exp(-G*(1+a4)));

figure
semilogx(G,S0,G,S3,G,S4)
xlabel('Offered Load (G)');
ylabel('Throughput (S)');
title('Throughput-Load of slotted 1-persistent CSMA');
legend('a = 0','a=0.1','a=1');
