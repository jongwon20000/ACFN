%
%  Attentional Correlation Filter Network for Adaptive Visual Tracking
%
%  Jongwon Choi, 2017
%  https://sites.google.com/site/jwchoivision/  
% 
%  MATLAB code for correlation filter network
%  When you use this code for your research, please refer the below references.
%  You can't use this code for any commercial purpose without author's
%  agreement.
%  If you have any question or comment, please contact to
%  jwchoi.pil@gmail.com.
%  
% 
%
%  Reference:
%  [1] J. Choi, et al., "Attentional Correlation Filter Network for Adaptive Visual Tracking", CVPR2017
%  [2] J. Choi, et al., "Visual Tracking Using Attention-Modulated Disintegration and Integration", CVPR2016


function output = filter_update(input, prev_input, xf_hog, xf_color, kernel, lambda, interp_factor)

switch input.kernelType
    case 'gaussian',
        if strcmp(input.featureType, 'hog')
            kf = gaussian_correlation(xf_hog, xf_hog, kernel.sigma);
        else
            kf = gaussian_correlation(xf_color, xf_color, kernel.sigma);
        end
    case 'polynomial',
        if strcmp(input.featureType, 'hog')
            kf = polynomial_correlation(xf_hog, xf_hog, kernel.poly_a, kernel.poly_b);
        else
            kf = polynomial_correlation(xf_color, xf_color, kernel.poly_a, kernel.poly_b);
        end
    case 'linear',
        if strcmp(input.featureType, 'hog')
            kf = linear_correlation(xf_hog, xf_hog);
        else
            kf = linear_correlation(xf_color, xf_color);
        end
end
dalphaf = 1 ./ (kf + lambda); 
output = input;

if(~isfield(prev_input, 'model_xf'))
    
    output.model_dalphaf = 1 ./ (kf + lambda);   %equation for fast training
    if strcmp(input.featureType, 'hog')
        output.model_xf = xf_hog;
    else
        output.model_xf = xf_color;
    end

    output.check = 1;
    
else
    
    output.model_dalphaf = (1 - interp_factor)*prev_input.model_dalphaf + interp_factor*dalphaf;
    if strcmp(input.featureType, 'hog')
        output.model_xf = (1 - interp_factor)*prev_input.model_xf + interp_factor*xf_hog;
    else
        output.model_xf = (1 - interp_factor)*prev_input.model_xf + interp_factor*xf_color;
    end

    output.check = 1;
    
end