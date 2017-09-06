close all
clear

%load data
data = textread('topo.dat','','headerlines',1);
x = data(:,1);
y = data(:,2);
z = data(:,3);

%reshape x,y,z vectors into matrices
nel = length(x);
nx = sqrt(nel);
ny = nx;

X = reshape(x,ny,nx);
Y = reshape(y,ny,nx);
Z = reshape(z,ny,nx);

%plot topography
figure(1)
surf(X,Y,Z)
xlabel('x')
ylabel('y')
zlabel('z')

%extract data along x = 1.2
extCol = find(X(1,:)==1.2);
yExt = Y(:,extCol);
zExt = Z(:,extCol);

%fit data to straight line
p = polyfit(yExt,zExt,1); %fit to n=1 polynomial
zFit = polyval(p,yExt); %calculated fitted curve
zNoTrend = zExt-zFit; %remove fit

%plot result using subplots
figure(2)

subplot(2,1,1) %1st window
plot(yExt,zExt,'bo') %plot data as blue circles
xlabel('y') %add axes labels
ylabel('z')
hold on %overlay plots
plot(yExt,zFit,'r-') %plot fit as red line
legend('data','fit','Location','NorthWest') %add legend to upper left

subplot(2,1,2) %2nd window
plot(yExt,zNoTrend,'gx') %plot residuals as green x's
xlabel('y')
ylabel('z')

