function  [W,b,sv] = SVM_linear(feature, label, C)
%feature: featureNo * instanceNo
%label: 1 * instancNo
InsNo = size(feature,2);
K = (feature'*feature).*(label'*label);
linear_coef = ones(InsNo,1).*(-1);
linear_constraint = label;
low_bound = zeros(InsNo,1);
up_bound = ones(InsNo,1)*C;
A = zeros(InsNo);
b = zeros(InsNo,1);
opti = quadprog(K,linear_coef,[],[],linear_constraint,0,low_bound,up_bound);
W = feature * (opti.*label');
sv = find(opti-0>=0.000001);
pos = find(C-opti(sv)>=0.00001);
sv_b = pos;
b = mean(1./label(sv_b) - W'*feature(:,sv_b));