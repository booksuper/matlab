%���㺯��Ŀ��ֵ
%�����������������ֵ
%���������Ŀ�꺯��ֵ
function [objvalue] = cal_objvalue(pop)
x = binary2decimal(pop);
%ת����������Ϊx�����ı仯��Χ����ֵ
objvalue=9.*sin(5.*x)+8.*cos(4.*x);%���ﺯ�������Լ�Ҫ������������