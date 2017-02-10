%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Filename:   main.m
%   Author:     Andre Phu-Van Nguyen <andre-phu-van.nguyen@polymtl.ca>
%   Class:      MTH8408
%   Description:Implementation of "Minimum Snap Trajectory Generation
%               and Control for Quadrotors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k_r = 4;    % Order of derivative of the position
k_psi = 2;  % Order of derivative of the yaw
mu_r = 1;   % Non-dimentionalization constant for the position integral
mu_psi = 1; % Non-dimentionalization constant for the yaw integral
n = 6;      % Order of the polynomials describing the trajectory
m = 4;      % Number of waypoints

% For a quadratic optimization problem of the form
%   min c'Hc + f'c
% We know the linear term f' is nul and c is a 4nm x 1 vector containing the
% coefficients of the polynomials. So now we have to build the matrix H.
t = [0 1 2 3];
H = buildh(n, m, mu_r, mu_psi, k_r, k_psi, t);