% 找到两个表格中波长数据的交集区域
wavelength_min = max(min(wavelength1), min(wavelength2));
wavelength_max = min(max(wavelength1), max(wavelength2));

% 仅保留交集区域内的数据
wavelength1_common = wavelength1(wavelength1 >= wavelength_min & wavelength1 <= wavelength_max);
reflection_relative_common = reflection_relative(wavelength1 >= wavelength_min & wavelength1 <= wavelength_max);

% 对第二张表格的纵坐标进行线性插值
reflection_absolute_interpolated = interp1(wavelength2, reflection_absolute, wavelength1_common, 'linear');

% 计算绝对吸收率
reflection_new_material = reflection_relative_common .* reflection_absolute_interpolated;

% 创建新的结果表格
results = [wavelength1_common, reflection_new_material];

% 保存结果到CSV文件
writematrix(results, 'Orange_reflection.csv');
