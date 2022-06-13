% This program is used to calculate the bit error rate (BER) of BPSK 
% modulation scheme at the given energy per bit to noise power spectral
% density ratio (EbNo). 

clear ;      %Clear all variables
close all;   %Close all figures
num_bit=1e6; %Number of bits or symbols
EbNodB=0:1:10; %Range of EbNo in dB
for i=1:length(EbNodB); 
    s=2*(round(rand(1,num_bit))-0.5); %Random symbol generation
    w=(1/sqrt(2*10^(EbNodB(i)/10)))*randn(1,num_bit); %Random noise generation
    r=s+w;  %Received signal
    s_est=sign(r);  %Demodulation
    sim_BER(i)=(num_bit-sum(s==s_est))/num_bit;%BER calculation
end
the_Ber =0.5*erfc(sqrt(10.^(EbNodB/10))); % theoretical BER calculation

semilogy(EbNodB, sim_BER,'-'); %Plotting simulated values
hold on
semilogy(EbNodB,the_Ber,'ko'); %Plotting theoretical values
title('BER curve for BPSK modulation');
legend('Simulation','Theoretical');
xlabel('EbNo(dB)')                              
ylabel('BER')                               
grid on