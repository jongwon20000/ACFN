

Attentional Correlation Filter Network for Adaptive Visual Tracking

    Jongwon Choi, 2017
    https://sites.google.com/site/jwchoivision/home/acfn-1

    When you use this code for your research, please refer the below reference.
    You can't use this code for any commercial purpose without author's agreement.
    If you have any question or comment, please contact to jwchoi.pil@gmail.com.


    Python & matlab code for attentional correlation filter network
	Attentional network : Attentional_Network_final.ipynb
	Correlation filter network ; ACFN_final/demo.m
	Two codes are communicated by socket communication. 
	(Default port = 50005)


    Running environment:
	Linux Ubuntu 14.04.5 LTS
	ipython 5.1.0
	tensorflow 0.10.0rc0
	CUDA Release 8.0, V8.0.26
	MATLAB 2015b

 
   Reference
    [1] Jongwon Choi, Hyung Jin Chang, Sangdoo Yun, Tobias Fischer, Yiannis Demiris, and Jin Young Choi, "Attentional Correlation Filter Network for Adaptive Visual Tracking", CVPR2017
    [2] Jongwon Choi, Hyung Jin Chang, Jiyeoup Jeong, Yiannis Demiris, and Jin Young Choi, "Visual Tracking Using Attention-Modulated Disintegration and Integration", CVPR2016


How to run the code:
	1. Run 'ACFN_final/demo.m'
	2. Run 'Attentional_Network_final.ipynb'


Q&A 1. Port connection problem
	Change the default port number from 50005 to other numbers (such as 50006, 50007) in both matlab code and python code.


-written: 20170505 Jongwon Choi