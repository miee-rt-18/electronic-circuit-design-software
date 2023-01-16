function result=s2pInterp(s2p , freqs)
% arguments

% end
result=interp1(s2p{2}, s2p{1} ,freqs,'spline');

end
