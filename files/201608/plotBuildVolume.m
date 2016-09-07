% make a plot ov the build volume of a delta printer
function plotBuildVolume(rodLen,deltaRad,height,bedRad)
DP.RodLen = rodLen;
DP.radius = deltaRad + [0 0 0];
ax = [-100:5:100];% * bedRad / 100;
n = length(ax);
v = zeros(length(ax));
for i = 1:n
  y=ax(i);
  for j=1:n
    x = ax(j);
    r = sqrt(x*x + y*y);
    if (r < bedRad)
      d = cart2delta(DP,[x,y,0]);
      v(i,j) = height-max(d);
    end
  end
end
mesh(ax,ax,v);
grid on;
xlabel X;ylabel Y
end
