function [xm,fv]=pso(fitness,n,c1,c2,w,m,d)
%c1学习因子1
%c2学习因子2
%w惯性权重，m最大迭代次数，d搜索空间维数，n初始化群体个体数目
%%%%初始化种群的个体，可以在这里限制位置和速度的范围%%%%
format long
for i=1:n
    for j=1:d
        x(i,j)=randn;
        v(i,j)=randn;
    end
end
%%%先计算各个粒子的适应度，并初始化pi和pg%%%
for i=1:n
    p(i)=fitness(x(i,:));
    y(i,:)=x(i,:);
end
pg=x(n,:);       %pg为全局最优
for i=1:(n-1)
    if fitness(x(i,:))< fitness(pg)
        pg=x(i,:);
    end
end
%%%进入主要循环，按照公式进行迭代，直到满足精度要求%%%
for t=1:m
    for i=1:n    %更新速度，位移
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
%%%最后给出计算结果
disp('*************************')
disp('目标函数取最小值的自变量：')
xm = pg'
disp('目标函数的最小值：')
fv=fitness(pg)
disp('*************************')