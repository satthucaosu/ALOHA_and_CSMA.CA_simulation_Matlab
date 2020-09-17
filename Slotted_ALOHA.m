%Pure ALOHA
N1 = 8;
N2 = 4;
N3 = 3; 
N4 = 2;
N5 = 1;
p = 0:0.01:1;

Throughput1 = N1*p.*(1-p).^(N1-1);
Throughput2 = N2*p.*(1-p).^(N2-1);
Throughput3 = N3*p.*(1-p).^(N3-1);
Throughput4 = N4*p.*(1-p).^(N4-1);
Throughput5 = N5*p.*(1-p).^(N5-1);

figure
plot(p,Throughput1,p,Throughput2,p,Throughput2,p,Throughput3,p,Throughput4,p,Throughput5);
xlabel('Transmission probability p')
ylabel('Throughput')
title('Throughput of Slotted ALOHA method')
legend('N = 8','N = 4','N = 3','N = 2','N = 1')

N = 1:40;
p = 1./N;
Throughput = N.*(p.*(1-p).^(N-1));

figure
plot(N,Throughput)
xlabel('Number of Nodes N')
ylabel('Throughput')
title('Maximum throughput of Slotted ALOHA method')


G = 0:0.1:5;
S = G.*exp(-G);
figure 
plot(G,S)
xlabel('Offered Load rate G')
ylabel('Throughput')
title('Throughput of Slotted ALOHA protocol')


