%omlsa+wavelete �Զ�������+����
%% ��������������������ȣ��õ���������
noi2=noi*1.1;                   %������������������ĺ���
noisy=clean+noi2;               % ������������
[SNRI,SNRO,segSNRI,segSNRO,LSDI,LSDO,PESQ_I,PESQ_O]=res_eva(clean,noi2,noisy,fs,frame,fstep);
clear SNRO segSNRO LSDO IPESQ_O;
fout=['d:/noisy_' int2str(SNRI) 'db'];
wavwrite(noisy,fs,fout);
segSNRI
%% omlsa��ǿ����
fin_om=fout;
fout_om=omlsa_ncre(fin_om);
%% С����ǿ����
fin_wl=fout_om;
fout_wl=wl_thre(fin_wl);
%% ������ǿЧ��
noisy_omlsa=wavread(fout_om);
noisy_omlsa_wavelet=wavread(fout_wl);
[omsla_iSNR,omsla_isegSNR,omsla_iLSD,omsla_iPESQ]=res_imp(clean,noi2,noisy_omlsa,fs,frame,fstep);
[wavelet_iSNR,wavelet_isegSNR,wavelet_iLSD,wavelet_iPESQ]=res_imp(clean,noi2,noisy_omlsa_wavelet,fs,frame,fstep);

%% ��β����
del_file=1;% �Ƿ�ɾ��������ļ�
if del_file
    delete([fout '.wav']);
    delete([fout_om '.wav']);
    delete([fout_wl '.wav']);
end
msgbox('�����������','������־','warn');
