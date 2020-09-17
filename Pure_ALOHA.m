%Pure ALOHA
N1 = 8;
N2 = 4;
N3 = 3; 
N4 = 2;
N5 = 1;
p = 0:0.01:1;

Throughput1 = N1*p.*(1-p).^(2*N1-2);
Throughput2 = N2*p.*(1-p).^(2*N2-2);
Throughput3 = N3*p.*(1-p).^(2*N3-2);
Throughput4 = N4*p.*(1-p).^(2*N4-2);
Throughput5 = N5*p.*(1-p).^(2*N5-2);

figure
plot(p,Throughput1,p,Throughput2,p,Throughput2,p,Throughput3,p,Throughput4,p,Throughput5);
xlabel('Transmission probability p')
ylabel('Throughput')
title('Throughput of Pure ALOHA method')
legend('N = 8','N = 4','N = 3','N = 2','N = 1')

N = 1:40;
p = 1./(2*N-1);
Throughput = N.*(p.*(1-p).^(2*N-2));

figure
plot(N,Throughput)
xlabel('Number of Nodes N')
ylabel('Throughput')
title('Maximum throughput of Pure ALOHA method')


G = 0:0.1:5;
S = G.*exp(-2*G);
figure 
plot(G,S)
xlabel('Offered Load rate G')
ylabel('Throughput')
title('Throughput of Pure ALOHA protocol')
