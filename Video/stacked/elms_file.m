c = 0;
final = ones(60,231);
Mat = importdata('/home/intern/internship_avec/prinshu/labels_metadata.csv');
for c = 1:60
    if (c == 7)
        continue;
    end
y1 = 'feature';
d1 = '/home/intern/internship_avec/prinshu/output_geometric_feature/';
y1 = strcat(d1,y1);
p = int2str(c);
p = strcat(p,'.mat');
y = strcat(y1,p);
load(y);
x = regexp(Mat(c+1),',','split');
y = x{1}{6};
Res = ones(10,24);
final(c,1) = y;
final(c,1) = final(c,1) - 48;
%Feature1
for j = 1:23
    final(c,j+1) = mean(result(:,j));
end
%feature 2
for j = 24:46
   final(c,j+1) = std(result(:,j-23));
end
%feature 3 and 4
for j =47:69
        xx = ones(4000,1);
        for k  = 1:4000
            xx(k) = k;
        end
        yy = result(:,j-46);
        pp = polyfit(xx,yy,2);
        final(c,j+1) = pp(1);
end
for j = 70:92
        yy = result(:,j-69);
        pp = polyfit(xx,yy,1);
        final(c,j+1) = pp(1);
        final(c,j+23+1) = pp(2);
        [mini,ind] = min(result(:,j-69));
        final(c,j+46+1) = mini;
        final(c,j+69+1) = ind;
        [maxim,ind] = max(result(:,j-69));
        final(c,j+92+1) = maxim;
        final(c,j+1+115) = ind; 
        final(c,j+1+138) = maxim - mini;
end
end

c1 = 0;
final1 = ones(104,231);
Mat = importdata('/home/intern/internship_avec/prinshu/labels_metadata.csv');
for c1 = 1:104
y1 = 'feature';
d1 = '/home/intern/internship_avec/prinshu/output_geometric_feature/';
y1 = strcat(d1,y1);
cc = c1+114;
p = int2str(cc);
p = strcat(p,'.mat');
y = strcat(y1,p);
load(y);
x = regexp(Mat(cc-54+1),',','split');
y = x{1}{6};
Res = ones(10,24);
final1(c1,1) = y;
final1(c1,1) = final1(c1,1) - 48;
%Feature1
for j = 1:23
    final1(c1,j+1) = mean(result(:,j));
end
%feature 2
for j = 24:46
   final1(c1,j+1) = std(result(:,j-23));
end
%feature 3 and 4
for j =47:69
        xx = ones(4000,1);
        for k  = 1:4000
            xx(k) = k;
        end
        yy = result(:,j-46);
        pp = polyfit(xx,yy,2);
        final1(c1,j+1) = pp(1);
end
for j = 70:92
        yy = result(:,j-69);
        pp = polyfit(xx,yy,1);
        final1(c1,j+1) = pp(1);
        final1(c1,j+23+1) = pp(2);
        [mini,ind] = min(result(:,j-69));
        final1(c1,j+46+1) = mini;
        final1(c1,j+69+1) = ind;
        [maxim,ind] = max(result(:,j-69));
        final1(c1,j+92+1) = maxim;
        final1(c1,j+1+115) = ind; 
        final1(c1,j+1+138) = maxim - mini;
end
end
%final = 1000*final;
%final1 = 1000*final1;
disp(final1)
save('/home/intern/internship_avec/prinshu/output_feature')
ELM(final1, final, 1, 20, 'sig');
