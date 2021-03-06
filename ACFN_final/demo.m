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
%  Running environment:
%  Linux Ubuntu 14.04.5 LTS
%  MATLAB R2015b
%  
%  Inputs --
%  seq_path : path to image sequence files
%  init_bbox : [center_x, center_y, w, h] bounding box at the first frame
%  PORT : socket communication port number (with attentional network)
% 
%  Outputs --
%  bbox : tracking results one row [center_x, center_y, w, h] for each frame
%  fps : average speed
% 
%  Examples:
%  >> run_tracker('data/Freeman1/', [264,80,23,28], 50006);
%
%  Reference:
%  [1] J. Choi, et al., "Attentional Correlation Filter Network for Adaptive Visual Tracking", CVPR2017
%  [2] J. Choi, et al., "Visual Tracking Using Attention-Modulated Disintegration and Integration", CVPR2016
% 
% 


run_tracker('data/Freeman1/', [264,80,23,28], 50005);