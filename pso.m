function [xm,fv]=pso(fitness,n,c1,c2,w,m,d)
%c1ѧϰ����1
%c2ѧϰ����2
%w����Ȩ�أ�m������������d�����ռ�ά����n��ʼ��Ⱥ�������Ŀ
%%%%��ʼ����Ⱥ�ĸ��壬��������������λ�ú��ٶȵķ�Χ%%%%
format long
for i=1:n
    for j=1:d
        x(i,j)=randn;
        v(i,j)=randn;
    end
end
%%%�ȼ���������ӵ���Ӧ�ȣ�����ʼ��pi��pg%%%
for i=1:n
    p(i)=fitness(x(i,:));
    y(i,:)=x(i,:);
end
pg=x(n,:);       %pgΪȫ������
for i=1:(n-1)
    if fitness(x(i,:))< fitness(pg)
        pg=x(i,:);
    end
end
%%%������Ҫѭ�������չ�ʽ���е�����ֱ�����㾫��Ҫ��%%%
for t=1:m
    for i=1:n    %�����ٶȣ�λ��
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        x(i,:)=x(i,:)+v(i,:);
        if fitness(x(i,:))<p(i)
            p(i)=fitness(x(i,:));
            y(i,:)=x(i,:);
        end
        if p(i)<fitness(pg)
            pg=y(i,:);
        end
    end
    pbest(t)=fitness(pg);
end
%%%������������
disp('*************************')
disp('Ŀ�꺯��ȡ��Сֵ���Ա�����')
xm = pg'
disp('Ŀ�꺯������Сֵ��')
fv=fitness(pg)
disp('*************************')