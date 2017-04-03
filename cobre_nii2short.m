for ss = 1:length(list_subject)
   system(['rm ' path_out filesep 'tmp*']);
   file_fmri = dir([path_in filesep 'fmri_*' list_subject{ss} '*.nii.gz']);
   file_fmri = file_fmri(1).name;
   file_tmp = ['tmp.nii.gz'];
   copyfile([path_in filesep file_fmri],[path_out filesep file_tmp]);
   system(['gunzip -f ' path_out filesep file_tmp]);
   file_tmp = ['tmp.nii'];
   file_tmp2 = ['tmp.mnc'];
   system(['nii2mnc ' path_out filesep file_tmp]);
   file_out = ['fmri_' list_subject{ss} '.nii'];
   system(['mnc2nii -short ' file_tmp2 ' ' path_out filesep file_out]);
   system(['gzip ' path_out filesep file_out]);
end

for ss = 1:length(list_subject)
   file_fmri = dir([path_in filesep 'fmri_*' list_subject{ss} '*_extra.mat']);
   file_fmri = file_fmri(1).name;
   file_out = ['fmri_' list_subject{ss} '_extra.mat'];
   copyfile([path_in filesep file_fmri],[path_out filesep file_out]);
end
