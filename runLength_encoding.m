%%% date- 1/4/2020; Renuka Soman
% code for Run Length Encoding and finding whether it is positive or
% negative compression

clc; clear all; close all;
ip= randi([0,1],1,100);  %  input of random bit sequence
% ip=[zeros(1,6) ones(1,12) zeros(1,10) ones(1,5)];
len_ip=length(ip);    %length of input sequence
bit=[];    %sequence of unique bits in input 
len=[];    %length of each bit in input
count=0;    %counter
for i=1:len_ip-1
    if ip(i) == ip(i+1)  %check if consecutive bits are equal
        count=count+1;
        continue
    end
    bit=[bit ip(i)];
    len=[len count+1];
    count=0;
end
last_bit=ip(i+1);
number=len_ip-sum(len);  %checking the number of times last bit occurs
bit=[bit last_bit];  %contains the order of bits (final)
len=[len number];     %count of the bits i.e. run length (final)

m=max(len);   %to find largest digit in len array
%the maximum length of binary number after encoding will depend on the
%number of bits required to encode m 
a=floor(log2(m)+1);
total=length(len)*a;
final_length=length(bit)+total;  %length of encoded signal

if final_length>len_ip
    disp('Negative compression');
    t=-1;
else
    disp('Positive compression');
    t=1;
end

if t==1
    comp_ratio=final_length/len_ip   %compression ratio
end