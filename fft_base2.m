function y=fft_base2(x)
% ʱ���ȡ����2FFT�㷨����Ƶ�ʳ�ȡ��������ǵ�λ���ں��棿

m=log2(2^nextpow2(length(x))); %���x���ȶ�Ӧ��2������ݴ�m
N=2^m;
if length(x)<N
    x=[x,zeros(1,N-length(x))]; %�����Ȳ���2���ݣ���0��2��������
    fprintf('����������Ȳ���2���������ݣ����油��У����\n');
end

%--------------------------------------------------------------------------
%���������н��е���
nxd=bin2dec(fliplr(dec2bin([1:N]-1,m)))+1; %��1��2^m���еĵ���
x=x(nxd); %������������Ϊ��ʼֵ
%--------------------------------------------------------------------------

%������������
%--------------------------------------------------------------------------
for mi=1:m %��DFT��m�λ�2�ֽ⣬�����ң���ÿ�ηֽ���DFT����
    step=2^mi;
    for n=0:(step/2-1) %���ο�Խ����ڵĸ��ε�������
        wn=exp(-1j*2*pi*n/step);%��ת����
        for k=0:(N/step-1) %ȷ��x��ÿһ�����ֵ�����ݹ�ʽ����һ��
            index0=k*step+n+1;%�½ű�����
            index1=k*step+step/2+n+1;
            
            temp0=x(index0)+wn*x(index1);%�������
            temp1=x(index0)-wn*x(index1);
            
            x(index0)=temp0;
            x(index1)=temp1;
        end
    end
end
y=x; %���

end