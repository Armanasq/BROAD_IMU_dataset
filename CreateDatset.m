%Conver broad dataset as input =[imu_acc imu_gyro imu_mag]
% all NaNs in output has been removed
clc
clear all
%add BROAD dataset (data_mat) file path in below
filepath = {"D:\broad-main\data_mat\26_disturbed_phone_vibration_A.mat"
"D:\broad-main\data_mat\27_disturbed_phone_vibration_B.mat"
"D:\broad-main\data_mat\28_disturbed_stationary_magnet_A.mat"
"D:\broad-main\data_mat\29_disturbed_stationary_magnet_B.mat"
"D:\broad-main\data_mat\30_disturbed_stationary_magnet_C.mat"
"D:\broad-main\data_mat\31_disturbed_stationary_magnet_D.mat"
"D:\broad-main\data_mat\32_disturbed_attached_magnet_1cm.mat"
"D:\broad-main\data_mat\33_disturbed_attached_magnet_2cm.mat"
"D:\broad-main\data_mat\34_disturbed_attached_magnet_3cm.mat"
"D:\broad-main\data_mat\35_disturbed_attached_magnet_4cm.mat"
"D:\broad-main\data_mat\36_disturbed_attached_magnet_5cm.mat"
"D:\broad-main\data_mat\37_disturbed_office_A.mat"
"D:\broad-main\data_mat\38_disturbed_office_B.mat"
"D:\broad-main\data_mat\39_disturbed_mixed.mat"
"D:\broad-main\data_mat\01_undisturbed_slow_rotation_A.mat"
"D:\broad-main\data_mat\02_undisturbed_slow_rotation_B.mat"
"D:\broad-main\data_mat\03_undisturbed_slow_rotation_C.mat"
"D:\broad-main\data_mat\04_undisturbed_slow_rotation_with_breaks_A.mat"
"D:\broad-main\data_mat\05_undisturbed_slow_rotation_with_breaks_B.mat"
"D:\broad-main\data_mat\06_undisturbed_fast_rotation_A.mat"
"D:\broad-main\data_mat\07_undisturbed_fast_rotation_B.mat"
"D:\broad-main\data_mat\08_undisturbed_fast_rotation_with_breaks_A.mat"
"D:\broad-main\data_mat\09_undisturbed_fast_rotation_with_breaks_B.mat"
"D:\broad-main\data_mat\10_undisturbed_slow_translation_A.mat"
"D:\broad-main\data_mat\11_undisturbed_slow_translation_B.mat"
"D:\broad-main\data_mat\12_undisturbed_slow_translation_C.mat"
"D:\broad-main\data_mat\13_undisturbed_slow_translation_with_breaks_A.mat"
"D:\broad-main\data_mat\14_undisturbed_slow_translation_with_breaks_B.mat"
"D:\broad-main\data_mat\15_undisturbed_fast_translation_A.mat"
"D:\broad-main\data_mat\16_undisturbed_fast_translation_B.mat"
"D:\broad-main\data_mat\17_undisturbed_fast_translation_with_breaks_A.mat"
"D:\broad-main\data_mat\18_undisturbed_fast_translation_with_breaks_B.mat"
"D:\broad-main\data_mat\19_undisturbed_slow_combined_240s.mat"
"D:\broad-main\data_mat\20_undisturbed_slow_combined_360s.mat"
"D:\broad-main\data_mat\21_undisturbed_fast_combined.mat"
"D:\broad-main\data_mat\22_undisturbed_fast_combined_240s.mat"
"D:\broad-main\data_mat\23_undisturbed_fast_combined_360s.mat"
"D:\broad-main\data_mat\24_disturbed_tapping_A.mat"
"D:\broad-main\data_mat\25_disturbed_tapping_B.mat"}
for i = 1:size(filepath)
    load(filepath{i});
    I = 0;
    J = 0;
    out_temp    =   opt_quat;
    indices     =   find(isnan(out_temp) == 1);
    [I,J]       =   ind2sub(size(out_temp),indices);
    in_temp    =   [imu_acc,imu_gyr,imu_mag];
    in_temp(I,:)=[];
    eval(sprintf('input%d= [in_temp];', i));
    out_temp(I,:)=[];
    eval(sprintf('output%d= [out_temp];', i));
    clear imu_gyr imu_acc imu_mag opt_quat opt_pos sampling_rate movement info I J out_temp indices in_temp i 
end
clear filepath