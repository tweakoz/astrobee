% Copyright (c) 2017, United States Government, as represented by the
% Administrator of the National Aeronautics and Space Administration.
%
% All rights reserved.
%
% The Astrobee platform is licensed under the Apache License, Version 2.0
% (the "License"); you may not use this file except in compliance with the
% License. You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
% License for the specific language governing permissions and limitations
% under the License.

function plotQuatsError3(time1,data1, time2, data2, time3, data3, titleStr, legend1, legend2,legend3, style2, style3)
% Prep for plot function in the telem class
figure;%(5); clf;
% Combine calcs into analysis file 
R1 = quat_to_eulers( data1 );
R2 = quat_to_eulers( data2 );
R3 = quat_to_eulers( data3 );



subplot(2,1,1);
plot(time1, R1*180/pi)
hold_on;
plot(time2, R2*180/pi, style2)
hold_on;
plot(time3, R3*180/pi, style3)
title(titleStr); grid on;
ylabel('Euler Angles, Deg'); xlabel('seconds')
legend([legend1 '_\theta'], [legend1 '_\phi'], [legend1 '_\psi'], [legend2 '_\theta'], [legend2 '_\phi'], [legend2 '_\psi'],...
    [legend3 '_\theta'], [legend3 '_\phi'], [legend3 '_\psi']);


subplot(2,1,2);
plot(time1, quat_error(data1,data2)/1000*180/pi);
title([titleStr ' Error']); grid on;
ylabel('Deg'); xlabel('seconds')

% Set the figure title
r = gca;
set(gcf, 'Name', r.Title.String)

