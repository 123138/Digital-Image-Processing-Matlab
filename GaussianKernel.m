function G_changed = GaussianKernel(deviation);
    x = [-3 -2 -1 0 1 2 3];
    y = [-3 -2 -1 0 1 2 3];

    for i = 1:5
        for k =1:5
        
    A = 1/(sqrt(2*pi)*(deviation^2));
    B= exp(-(x(i)^2+y(k)^2)/(2*(deviation^2)));
    G(i,k)=A*B;
    G_changed(i,k) = round(G(i,k)/G(1,1));


        end
    end
end