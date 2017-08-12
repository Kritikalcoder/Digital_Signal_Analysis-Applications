x = [ 0 0 1 1 1 0 0 ];
y = [ 0 1 2 3 2 1 0 ];
z = conv2(x,y);
xaxis = [ 1 2 3 4 5 6 7 ];
subplot(1,3,1)
plot(xaxis,x), xlabel(''),ylabel('x'),axis([0 7 0 7])
subplot(1,3,2)
plot(xaxis,y),xlabel(''),ylabel('y'),axis([0 7 0 7])
subplot(1,3,3)
xaxis = [1 2 3 4 5 6 7 8 9 10 11 12 13 ];
plot(xaxis,z),xlabel(''),ylabel('x*y'),axis([0 13 0 13])