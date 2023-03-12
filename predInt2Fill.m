function predInt2Fill(x,pedIntOutput,options)
%predInt2Fill written by R J Scales 2023 as part of Shaded-Error-Region 
%GitHub repository for the OxfordMicromechanicsGroup.
%This function converts the MATLAB inherent prediction interval into a
%format that has a shaded region instead to plot for ease of reading the
%data.
% 
% Inputs:
%       x (:, 1) double
%           This is the x-values for the plot
%       pedIntOutput (:, 2) double
%           This is the ouput from the 'predint' MATLAB
%       Name-Value Pairs:
%           Color (1,:) char = 'blue'
%               Enter in a valid character colour definition for the colour
%               of the region
%           Alpha (1,1) double = 0.1
%               This is the alpha of the filled in region, 0 being
%               completely transparent and 1 being opaque.
%           DisplayName (1,:) char
%               This is the DisplayName for the legend of this filled in
%               region in the plot. If left blank then it will not show any
%               entry.

arguments
    x (:, 1) double
    pedIntOutput (:, 2) double
    options.Color (1,:) char = 'blue'
    options.Alpha (1,1) double = 0.1
    options.DisplayName (1,:) char
end

LowerBound = pedIntOutput(:,1);
UpperBound = pedIntOutput(:,2);

xPath = vertcat(x, flipud(x));
yPath = vertcat(UpperBound, flipud(LowerBound));

% https://uk.mathworks.com/help/matlab/creating_plots/line-plot-with-confidence-bounds.html
p = fill(xPath,yPath,options.Color);
p.FaceAlpha = options.Alpha;      
p.EdgeColor = 'none';  
if isfield(options, 'DisplayName') == 0
    set(get(get(p,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
else
    p.DisplayName = options.DisplayName;
end

end