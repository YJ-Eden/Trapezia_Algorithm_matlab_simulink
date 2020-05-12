%tixing.m
function x1=tixing(x1_0,x2_0,n)
    x1(1)=x1_0;
    x2(1)=x2_0;
    for t=2:n+1
        x2p=euler2(x1(t-1),x2(t-1));
        x1p=euler1(x1(t-1),x2(t-1));
        x2(t)=tixing2(x1p,x2p,x1(t-1),x2(t-1));
        x1(t)=tixing1(x2p,x1(t-1),x2(t-1));
    end       
end

function x1p=euler1(x1_,x2_)
    f_=x1f(x2_);
    x1p=x1_+0.1*f_;
end

function x2p=euler2(x1_,x2_)
    f_=x2f(x1_,x2_);
    x2p=x2_+0.1*f_;
end

function x1=tixing1(x2p,x1_,x2_)
    fp=x1f(x2p);
    f_=x1f(x2_);
    x1=x1_+0.05*(fp+f_);
end

function x2=tixing2(x1p,x2p,x1_,x2_)
    fp=x2f(x1p,x2p);
    f_=x2f(x1_,x2_);
    x2=x2_+0.05*(fp+f_);
end

function x1=x1f(x2)
    x1=x2;
end

function x2=x2f(x1,x2)
    x2=-2*x1-x2+5;
end